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
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),], spacing: 20) {
                    ForEach(viewStore.ingredientsList) { ingredient in
                        IngredientButtonView(ingredient: ingredient) {
                            viewStore.send(.toggleIngredient(ingredient))
                        }
                    }
                }
                .animation(.spring())
                .padding(.leading)
                
                Text("Showing \(viewStore.searchResults.count) results")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.leading)
                    .lineLimit(1)
                
                ForEach(viewStore.searchResults) { recipe in
                    NavigationLink(
                        destination:
                            RecipeLargeView(
                                recipe: recipe,
                                action: { viewStore.send(.toggleFavorited(recipe)) },
                                favorited: viewStore.favoritedRecipes.contains(recipe)
                            )
                    ) {
                        RecipeView(recipe: recipe, isFavorited: viewStore.favoritedRecipes.contains(recipe))
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Search Results")
            .toolbar {
                ToolbarItem {
                    Button("Ingredients") {
                        viewStore.send(.toggleSheet)
                    }
                }
            }
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static let mockStore = Store(
        initialState: Root.State(searchResults: Recipe.allRecipes),
        reducer:      Root.reducer,
        environment:  Root.Environment()
    )
    static var previews: some View {
        SearchResultsView(store: mockStore)
    }
}


