//
//  ContentView.swift
//  Cookable
//
//  Created by Kody Deda on 3/15/21.
//

import SwiftUI
import ComposableArchitecture

struct Root {
    struct State: Equatable {
        var recipeList        : [Recipe] = Recipe.allRecipes
        var recipeSearch      : [Recipe] = []
        var recipeFavorites   : [Recipe] = []
        var searchIngredients : [Recipe.Ingredient] = []
        var onboarding        = false
        var sheet             = false
        var alert             : AlertState<Root.Action>?
        var isSearching       : Bool { !(recipeSearch.isEmpty && searchIngredients.isEmpty) }
    }
    
    enum Action: Equatable {
        // General
        case onAppear
        case save
        case load
        case keyPath(BindingAction<Root.State>)
        
        // Onboarding
        case toggleOnboaring
        
        // SearchSheet
        case toggleSearchSheet
        case toggleSearchSheetIngredient(Recipe.Ingredient)
        case searchSheetSearchButtonTapped
        case searchSheetClearAllButtonTapped
        
        // Favorites
        case toggleFavoritedRecipe(Recipe)
        case clearFavoritesAlert
        case clearFavoritesAlertDismissed
        case clearFavoritesAlertConfirmed
    }
    
    struct Environment {
        var recipeFavoritesURL: URL {
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                .appendingPathComponent("state")
        }
    }
}

extension Root {
    static let reducer = Reducer<State, Action, Environment>.combine(
        Reducer { state, action, environment in
            switch action {
                
            // General
            case .onAppear:
                print("appeared")
                return Effect(value: .load)
                
            case .save:
                let _ = JSONEncoder().write(state.recipeFavorites, to: environment.recipeFavoritesURL)
                return .none
                
            case .load:
                switch JSONDecoder().load([Recipe].self, from: environment.recipeFavoritesURL) {
                case let .success(decodedState):
                    state.recipeFavorites = decodedState
                case .failure(_):
                    print("failed to load")
                }
                return .none
                
            case .keyPath:
                return .none

            // Onboarding
            case .toggleOnboaring:
                state.onboarding.toggle()
                return .none

            // SearchSheet
            case .toggleSearchSheet:
                state.sheet.toggle()
                return .none

            case let .toggleSearchSheetIngredient(ingredient):
                switch state.searchIngredients.contains(ingredient) {
                case true:
                    state.searchIngredients = state.searchIngredients.filter { $0 != ingredient }
                case false:
                    state.searchIngredients.append(ingredient)
                }
                return .none

            case .searchSheetClearAllButtonTapped:
                state.searchIngredients = []
                return .none
                
            case .searchSheetSearchButtonTapped:
                state.recipeSearch = state.recipeList.filter { recipe in
                    let sharedIngredients = recipe.ingredients.filter { state.searchIngredients.contains($0) }
                    
                    return sharedIngredients.count > 0
                }
                return Effect(value: .toggleSearchSheet)


            // Favorites
            case let .toggleFavoritedRecipe(recipe):
                switch state.recipeFavorites.contains(recipe) {
                case true:
                    state.recipeFavorites = state.recipeFavorites.filter { $0 != recipe }
                case false:
                    state.recipeFavorites.append(recipe)
                }
                return Effect(value: .save)
                
            case .clearFavoritesAlert:
                state.alert = .init(
                    title: TextState("Clear Favorites?"),
                    message: TextState("You cannot undo this action."),
                    primaryButton: .destructive(TextState("Confirm"), send: .clearFavoritesAlertConfirmed),
                    secondaryButton: .cancel()
                )
                return .none

            case .clearFavoritesAlertDismissed:
                state.alert = nil
                return .none

            case .clearFavoritesAlertConfirmed:
                state.recipeFavorites = []
                return .none
            }
        }
        .binding(action: /Action.keyPath)
        .debug()
    )
}

extension Root {
    static let defaultStore = Store(
        initialState: .init(),
        reducer: reducer,
        environment: .init()
    )
}




