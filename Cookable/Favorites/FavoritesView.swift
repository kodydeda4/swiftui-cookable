//
//  FavoritesView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct FavoritesView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) {viewStore in
            NavigationView {
                if viewStore.favoritedRecipes.count == 0 {
                    Text("Empty")
                        .font(.title)
                        .foregroundColor(Color(.gray))
                        .navigationBarTitle("Favorites")
                } else {
                    ScrollView {
                        ForEach(viewStore.favoritedRecipes) { recipe in
                            NavigationLink(
                                destination: RecipeLargeView(
                                    recipe: recipe,
                                    action: { viewStore.send(.toggleFavorited(recipe)) },
                                    favorited: viewStore.favoritedRecipes.contains(recipe)
                                )
                            ) {
                                RecipeView(
                                    recipe: recipe,
                                    action: { viewStore.send(.toggleFavorited(recipe)) }
                                )
                            }
                            .padding()
                        }
                    }
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
        FavoritesView(store: Root.defaultStore)
    }
}
