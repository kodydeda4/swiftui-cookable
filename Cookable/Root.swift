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
        // state
        let groupMembers = ["Kody Deda", "Zane Bernard", "Zachary Mitzke", "Robin Wood", "Paolo Imperio"]
        var recipes: [Recipe] = [
            Recipe(name: "Apples", description: "Description of apples", ingredients: [.apple]),
            Recipe(name: "Bannas", description: "Description of bannanas", ingredients: [.apple]),
            Recipe(name: "Fruit Salad", description: "Description of fruit salad", ingredients: [.apple, .bananna, .orange]),
        ]
        var favoritedRecipes: [Recipe] = []
        var ingredientsList: [Recipe.Ingredient] = [.apple, .orange]
    }
    
    enum Action: Equatable {
        // action
        case toggleFavorited(Recipe)
        case toggleIngredient(Recipe.Ingredient)
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




// MARK:- RootView
struct RootView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            TabView {
                AboutView(store: store)
                    .tabItem { Label("About", systemImage: "gear") }
                SearchView(store: store)
                    .tabItem { Label("Search", systemImage: "magnifyingglass") }
                FavoritesView(store: store)
                    .tabItem { Label("Favorites", systemImage: "star.fill") }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}
