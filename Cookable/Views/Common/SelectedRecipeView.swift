//
//  RecipeLargeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI
import ComposableArchitecture
import Introspect
import FancyScrollView

struct SelectedRecipeView: View {
    let store: Store<Root.State, Root.Action>
    let recipe: Recipe
    
    var body: some View {
        WithViewStore(store) { viewStore in
            FancyScrollView(
                title: "",
                headerHeight: 350,
                scrollUpHeaderBehavior: .parallax,
                scrollDownHeaderBehavior: .offset,
                header: { Image(recipe.imageName).resizable().aspectRatio(contentMode: .fill) }
            ) {
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
                        .font(.title2)
                        .bold()
                    
                    LazyVGrid(
                        columns: [GridItem](repeating: .init(.flexible()), count: 4),
                        spacing: 20
                    ) {
                        ForEach(recipe.ingredients.filter { viewStore.ingredientsList.contains($0) }) { ingredient in
                            IngredientView(
                                ingredient: ingredient,
                                selected: viewStore.ingredientsList.contains(ingredient)
                            )
                        }
                        ForEach(recipe.ingredients.filter { !viewStore.ingredientsList.contains($0)  }) { ingredient in
                            IngredientView(
                                ingredient: ingredient,
                                selected: viewStore.ingredientsList.contains(ingredient)
                            )
                        }
                    }
                    
                    Divider()
                    Text("Instructions")
                        .font(.title2)
                        .bold()

                    ForEach(Array(zip(recipe.steps.indices, recipe.steps)), id: \.0) { index, step in
                        VStack(alignment: .leading) {
                            Text("Step \(index+1)")
                                .font(.headline)
                            Text("\(step)")
                        }
                        .padding(.vertical)
                    }
                }
                .padding()
            }
        }
    }
}

struct SelectedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRecipeView(store: Root.defaultStore, recipe: Recipe.allRecipes.first!)
    }
}
