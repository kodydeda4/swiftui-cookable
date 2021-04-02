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
        WithViewStore(store) {viewStore in
            NavigationView {
                if viewStore.favoritedRecipes.isEmpty {
                    EmptyFavoritesView()
                } else {
                    List(viewStore.favoritedRecipes) {
                        Text($0.name)
                    }
//                    ScrollView {
//                        ForEach(viewStore.favoritedRecipes) { recipe in
//                            NavigationLink(
//                                destination: RecipeLargeView(
//                                    recipe: recipe,
//                                    action: { viewStore.send(.toggleFavorited(recipe)) },
//                                    favorited: viewStore.favoritedRecipes.contains(recipe)
//                                )
//                            ) {
//                                RecipeView(recipe: recipe, isFavorited: viewStore.favoritedRecipes.contains(recipe))
//                            }
//                            .padding()
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
