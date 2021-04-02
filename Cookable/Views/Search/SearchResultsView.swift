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
                if viewStore.selectedRecipe == nil {
                    LazyVGrid(
                        columns: [GridItem](repeating: .init(.flexible()), count: 4),
                        spacing: 20
                    ) {
                        ForEach(viewStore.ingredientsList) { ingredient in
                            Button(action: { viewStore.send(.toggleIngredient(ingredient)) }) {
                                IngredientView(
                                    ingredient: ingredient,
                                    selected: true
                                )
                            }
                        }
                    }
                    .padding()
                    ScrollView {
                        ForEach(viewStore.searchResults) { recipe in
                            Button(action: { viewStore.send(.updateSelectedRecipe(recipe)) }) {
                                RecipeView(recipe: recipe)
                            }
                        }
                    }
                } else {
                    SelectedRecipeView(
                        recipe: viewStore.selectedRecipe!,
                        ingredientsList: viewStore.ingredientsList,
                        toggleFavoriteAction: { viewStore.send(.toggleFavorited(viewStore.selectedRecipe!)) },
                        toggleSelectedAction: { viewStore.send(.updateSelectedRecipe(nil)) },
                        favorited: viewStore.favoritedRecipes.contains(viewStore.selectedRecipe!)
                    )
                }
            }
            .animation(.spring(), value: viewStore.selectedRecipe)
        }
    }
}


struct SearchResultsView_Previews: PreviewProvider {
    static let mockStore = Store(
        initialState: Root.State(searchResults: Recipe.allRecipes, ingredientsList: Recipe.Ingredient.allCases),
        reducer:      Root.reducer,
        environment:  Root.Environment()
    )
    static var previews: some View {
        SearchResultsView(store: mockStore)
        SearchResultsView(store: Root.defaultStore)
    }
}
