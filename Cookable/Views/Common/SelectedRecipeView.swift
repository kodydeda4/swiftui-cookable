//
//  RecipeLargeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI
import ComposableArchitecture

struct SelectedRecipeView: View {
    let store: Store<Root.State, Root.Action>
    let recipe: Recipe
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
//                    VStack(alignment: .leading) {
//                        // img stuff
//                    }
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 400)
//                    .background(
//                        Image(recipe.imageName)
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                    )
//                    .clipShape(Rectangle())
                    
                    Color.clear
                        .frame(height: 350)
                        .overlay(
                            Image(recipe.imageName)
                                .resizable()
                                .scaledToFill()
                                .clipped()
                        )
                        .clipShape(Rectangle())

                    
                    
                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(recipe.name)
                                .font(.title)
                                .bold()
                            
                            Spacer()
                            Button(action: { viewStore.send(.toggleFavorited(recipe)) }) {
                                Image(systemName: viewStore.favoritedRecipes.contains(recipe) ? "heart.fill" : "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(viewStore.favoritedRecipes.contains(recipe) ? .pink : .primary)
                                    .frame(width: 30, height: 30)
                            }
                        }
                        Divider()
                        Text(recipe.description)
                            .foregroundColor(.secondary)
                        
                        Divider()
                        Text("Ingredients")
                        
                        LazyVGrid(
                            columns: [GridItem](repeating: .init(.flexible()), count: 4),
                            spacing: 20
                        ) {
                            ForEach(recipe.ingredients.filter { viewStore.ingredientsList.contains($0)  }) { ingredient in
                                IngredientView(ingredient: ingredient, selected: viewStore.ingredientsList.contains(ingredient))
                            }
                            ForEach(recipe.ingredients.filter { !viewStore.ingredientsList.contains($0)  }) { ingredient in
                                IngredientView(ingredient: ingredient, selected: viewStore.ingredientsList.contains(ingredient))
                            }
                        }
                    }
                    .padding()
                    //.frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct SelectedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRecipeView(store: Root.defaultStore, recipe: Recipe.allRecipes.first!)
    }
}
