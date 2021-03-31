//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

// TODO: Fix tapping out of bounds

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
                            IngredientButtonView(ingredient: ingredient, selected: true) {
                                viewStore.send(.toggleIngredient(ingredient))
                            }
                        }
                    }
                    .padding()
                    
                    ScrollView {
                        ForEach(viewStore.searchResults) { recipe in
                            Button(action: { viewStore.send(.updateSelectedRecipe(recipe)) }) {
                                VStack(alignment: .leading) {
                                    Color.clear
                                        .frame(height: 300)
                                        .overlay(Image(recipe.imageName).resizable().scaledToFill().clipped())
                                        .clipShape(Rectangle())
                                    
                                    Spacer()
                                    VStack(alignment: .leading) {
                                        Text(recipe.name)
                                            .font(.title)
                                            .fontWeight(.black)
                                            .foregroundColor(.primary)
                                        Text(recipe.description.uppercased())
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                            .lineLimit(1)
                                    }
                                    .padding()
                                }
                                .background(Color(.tertiarySystemBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .padding()
                            }
                        }
                    }
                } else {
                    SelectedRecipeView(
                        recipe: viewStore.selectedRecipe!,
                        toggleFavoriteAction: { viewStore.send(.toggleFavorited(viewStore.selectedRecipe!)) },
                        toggleSelectedAction: { viewStore.send(.updateSelectedRecipe(nil)) },
                        favorited: viewStore.favoritedRecipes.contains(viewStore.selectedRecipe!)
                    )
                }
            }
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
