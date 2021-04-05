//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct SearchResultsView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                LazyVGrid(
                    columns: [GridItem](repeating: .init(.flexible()), count: 4),
                    spacing: 20
                ) {
                    ForEach(viewStore.searchIngredients) { ingredient in
                        Button(action: { viewStore.send(.toggleSearchSheetIngredient(ingredient)) }) {
                            IngredientView(
                                ingredient: ingredient,
                                selected: true
                            )
                        }
                    }
                }
                .padding()
                ScrollView {
                    ForEach(viewStore.recipeSearch) { recipe in
                        NavigationLink(destination: SelectedRecipeView(store: store, recipe: recipe)) {
                            RecipeView(recipe: recipe, favorited: viewStore.recipeFavorites.contains(recipe))
                        }
                    }
                }
            }
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
//    static let mockStore = Store(
//        initialState: Root.State(recipeSearchResults: Recipe.allRecipes, ingredientsList: Recipe.Ingredient.allCases),
//        reducer:      Root.reducer,
//        environment:  Root.Environment()
//    )
    static var previews: some View {
//        SearchResultsView(store: mockStore)
        SearchResultsView(store: Root.defaultStore)
    }
}
 
