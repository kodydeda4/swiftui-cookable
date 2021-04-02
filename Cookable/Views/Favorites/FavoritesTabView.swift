//
//  FavoritesView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct FavoritesTabView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                if viewStore.favoritedRecipes.isEmpty {
                    EmptyFavoritesView()
                } else {
                    VStack {
                        if viewStore.selectedFavoriteRecipe == nil {
//                            LazyVGrid(
//                                columns: [GridItem](repeating: .init(.flexible()), count: 4),
//                                spacing: 20
//                            ) {
//                                ForEach(viewStore.ingredientsList) { ingredient in
//                                    Button(action: { viewStore.send(.toggleIngredient(ingredient)) }) {
//                                        IngredientButtonView(
//                                            ingredient: ingredient,
//                                            selected: true
//                                        )
//                                    }
//                                }
//                            }
//                            .padding()
                            ScrollView {
                                ForEach(viewStore.favoritedRecipes) { recipe in
                                    Button(action: { viewStore.send(.updateSelectedFavoriteRecipe(recipe)) }) {
                                        RecipeView(recipe: recipe)
                                    }
                                }
                            }
                        } else {
                            SelectedRecipeView(
                                recipe: viewStore.selectedFavoriteRecipe!,
                                toggleFavoriteAction: { viewStore.send(.toggleFavorited(viewStore.selectedRecipe!)) },
                                toggleSelectedAction: { viewStore.send(.updateSelectedFavoriteRecipe(nil)) },
                                favorited: viewStore.favoritedRecipes.contains(viewStore.selectedFavoriteRecipe!)
                            )
                        }
                    }
                    .animation(.spring(), value: viewStore.selectedRecipe)
//                    LazyVGrid(
//                        columns: [GridItem](repeating: .init(.flexible()), count: 4),
//                        spacing: 20
//                    ) {
//                        ForEach(viewStore.ingredientsList) { ingredient in
//                            Button(action: { viewStore.send(.toggleIngredient(ingredient)) }) {
//                                IngredientButtonView(
//                                    ingredient: ingredient,
//                                    selected: true
//                                )
//                            }
//                        }
//                    }
                    .alert(store.scope(state: \.alert), dismiss: .dismissResetAlert)
                    .navigationBarTitle("Favorites")
                    .toolbar {
                        ToolbarItem {
                            Button("Clear All") {
                                viewStore.send(.clearFavoritesButtonTapped)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesTabView(store: Root.defaultStore)
    }
}
