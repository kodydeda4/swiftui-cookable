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
                                        .frame(height: 200)
                                        .overlay(
                                            Image(recipe.imageName)
                                                .resizable()
                                                .scaledToFill()
                                                .clipped()
                                        )
                                        .clipShape(Rectangle())
                                    
                                    Spacer()
                                    VStack(alignment: .leading) {
                                        Text(recipe.name)
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(.primary)
                                        
                                        Text(recipe.description.uppercased())
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                            .lineLimit(1)
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    .padding(.trailing, 6)
                                    .padding(.vertical, 8)
                                    
                                }
                                .background(Color(.secondarySystemBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                //                                .shadow(radius: 10)
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
