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
        var recipes          : [Recipe] = Recipe.allRecipes
        var searchResults    : [Recipe] = []
        var favoritedRecipes : [Recipe] = []
        var ingredientsList  : [Recipe.Ingredient] = []
        var sheet            = false
        var alert            : AlertState<Root.Action>?
        var onboarding       = true
        
        var selectedRecipe:  Recipe?
        
        var showingSearchResults: Bool {
            !searchResults.isEmpty && !ingredientsList.isEmpty
        }
    }
    
    enum Action: Equatable {
        case toggleFavorited(Recipe)
        case toggleIngredient(Recipe.Ingredient)
        case toggleSheet
        case toggleOnboaring
        case keyPath(BindingAction<Root.State>)
        case clearFavoritesButtonTapped
        case clearFavorites
        case dismissResetAlert
        case clearButtonTapped
        case searchButtonTapped
        case updateSelectedRecipe(Recipe?)
    }
    
    struct Environment {
        // environment
    }
}

extension Root {
    static let reducer = Reducer<State, Action, Environment>.combine(
        Reducer { state, action, environment in
            switch action {
            case .keyPath:
                return .none

            case let .toggleFavorited(recipe):
                switch state.favoritedRecipes.contains(recipe) {
                case true:
                    state.favoritedRecipes = state.favoritedRecipes.filter { $0 != recipe }
                case false:
                    state.favoritedRecipes.append(recipe)
                }
                return .none
                
            case let .toggleIngredient(ingredient):
                switch state.ingredientsList.contains(ingredient) {
                case true:
                    state.ingredientsList = state.ingredientsList.filter { $0 != ingredient }
                case false:
                    state.ingredientsList.append(ingredient)
                }
                return .none
                    
            case .searchButtonTapped:
                state.searchResults = state.recipes.filter { recipe in
                    let sharedIngredients = recipe.ingredients.filter { state.ingredientsList.contains($0) }
                    
                    return sharedIngredients.count > 0
                }
                return Effect(value: .toggleSheet)
                
            case .toggleSheet:
                state.sheet.toggle()
                return .none
                
            case .clearButtonTapped:
                state.ingredientsList = []
                return .none
                
            case .clearFavorites:
                state.favoritedRecipes = []
                return .none
                
            case .clearFavoritesButtonTapped:
                state.alert = .init(
                    title: TextState("Clear Favorites?"),
                    message: TextState("You cannot undo this action."),
                    primaryButton: .destructive(TextState("Confirm"), send: .clearFavorites),
                    secondaryButton: .cancel()
                )
                return .none
                
            case .dismissResetAlert:
                state.alert = nil
                return .none

            case .toggleOnboaring:
                state.onboarding.toggle()
                return .none
                
            case let .updateSelectedRecipe(optional):
                state.selectedRecipe = optional
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




