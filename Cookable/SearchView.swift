//
//  SearchView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct SearchView: View {
    let store: Store<Root.State, Root.Action>
        
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack {
                    HStack {
                        ForEach(viewStore.ingredientsList) { ingredient in
                            IngredientView(ingredient: ingredient) {
                                viewStore.send(.toggleIngredient(ingredient))
                            }
                        }
                        Spacer()
                    }
                    .animation(.spring())
                    .padding()

                    ScrollView {
                        ForEach(viewStore.recipes) { recipe in
                            RecipeView(recipe: recipe) {
                                viewStore.send(.toggleFavorited(recipe))
                            }
                        }
                    }
                }
                .navigationBarTitle("Search")
                .navigationBarHidden(false)
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(store: Root.defaultStore)
    }
}
