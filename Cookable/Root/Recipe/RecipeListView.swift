//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct RecipesList: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                IngredientsList(store: store).padding()
                ScrollView {
                    ForEach(viewStore.searchResults) { recipe in
                        NavigationLink(destination: RecipeLargeView(recipe: recipe)) {
                            RecipeView(recipe: recipe, action: { viewStore.send(.toggleFavorited(recipe)) })
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitle("Search")
        }
    }
}

struct RecipesList_Previews: PreviewProvider {
    static let mockStore = Store(
        initialState: Root.State(searchResults: Recipe.allRecipes),
        reducer:      Root.reducer,
        environment:  Root.Environment()
    )
    static var previews: some View {
        RecipesList(store: mockStore)
    }
}


