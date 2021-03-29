//
//  SearchView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct IngredientsList: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                ForEach(viewStore.ingredientsList) { ingredient in
                    RemoveIngredientView(ingredient: ingredient) {
                        viewStore.send(.toggleIngredient(ingredient))
                    }
                }
                Spacer()
            }
            .animation(.spring())
        }
    }
}

struct RecipesList: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ScrollView {
                ForEach(viewStore.recipes) { recipe in
                    RecipeView(recipe: recipe) {
                        viewStore.send(.toggleFavorited(recipe))
                    }
                }
            }
        }
    }
}

struct SearchView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                if viewStore.ingredientsList.count == 0 {
                    VStack {
                        Text("Get Started")
                            .font(.title)
                            .foregroundColor(Color(.gray))
                            .navigationBarTitle("Search")
                        
                        Button("Add Ingredients") {
                            viewStore.send(.toggleSheetView)
                        }
                        .padding()
                    }
                } else {
                    VStack {
                        IngredientsList(store: store).padding()
                        RecipesList(store: store)
                    }
                    .navigationBarTitle("Search")
                }
            }
            .sheet(isPresented: viewStore.binding(get: \.sheetView, send: .toggleSheetView)) {
                VStack(alignment: .leading) {
                    Text("Start Finding Recipes...")
                        .font(.title)
                        .bold()
                    
                    Divider()
                    Text("Search")
                        .font(.title2)
                        .bold()
                    if viewStore.ingredientsList.count == 0 {
                        
                        Text("Tap ingredients to add them to your search...")
                            .font(.caption)
                        
                    } else {
                        IngredientsList(store: store)
                    }
                    Divider()
                    
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                    HStack {
                        ForEach(Recipe.Ingredient.allCases) { ingredient in
                            AddIngredientView(
                                ingredient: ingredient,
                                selected: viewStore.ingredientsList.contains(ingredient)
                            ) {
                                viewStore.send(.toggleIngredient(ingredient))
                            }
                        }
                    }
                    Spacer()
                    Button(action: {
                        viewStore.send(.toggleSheetView)
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 40)
                            .foregroundColor(.blue)
                            .overlay(Text("Search").foregroundColor(.white))
                    }
                    
                }
                .padding()
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(store: Root.defaultStore)
    }
}
