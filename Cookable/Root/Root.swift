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
        let groupMembers     = ["Kody Deda", "Zane Bernard", "Zachary Mitzke", "Robin Wood", "Paolo Imperio"]
        var recipes          : [Recipe] = Recipe.allRecipes
        var searchResults    : [Recipe] = []
        var favoritedRecipes : [Recipe] = []
        var ingredientsList  : [Recipe.Ingredient] = []
        var sheet            = false
        
    }
    
    enum Action: Equatable {
        case toggleFavorited(Recipe)
        case toggleIngredient(Recipe.Ingredient)
        case toggleSheet
        case keyPath(BindingAction<Root.State>)
        case clearButtonTapped
        case updateSearchResults
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
                return Effect(value: .updateSearchResults)
                    
            case .updateSearchResults:
                state.searchResults = state.recipes.filter { recipe in
                    let sharedIngredients = recipe.ingredients.filter { state.ingredientsList.contains($0) }
                    
                    return sharedIngredients.count > 0
                }
                return .none
                
            case .toggleSheet:
                state.sheet.toggle()
                return .none
                
            case .clearButtonTapped:
                state.ingredientsList = []
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




