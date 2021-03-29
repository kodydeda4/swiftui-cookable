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
        var favoritedRecipes : [Recipe] = []
        var ingredientsList  : [Recipe.Ingredient] = [.apple, .orange]
        var sheetView = false
    }
    
    enum Action: Equatable {
        case toggleFavorited(Recipe)
        case toggleIngredient(Recipe.Ingredient)
        case toggleSheetView
    }
    
    struct Environment {
        // environment
    }
}

extension Root {
    static let reducer = Reducer<State, Action, Environment>.combine(
        Reducer { state, action, environment in
            switch action {
            
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
                
            case .toggleSheetView:
                state.sheetView.toggle()
                return .none
            }
        }
    )
}

extension Root {
    static let defaultStore = Store(
        initialState: .init(),
        reducer: reducer,
        environment: .init()
    )
}




