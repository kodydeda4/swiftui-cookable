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
    
    @Environment(\.presentationMode) var presentationMode
    
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
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                        Button(action: { viewStore.send(.toggleFavoritedRecipe(recipe)) }) {
                            Image(systemName: viewStore.recipeFavorites.contains(recipe) ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(viewStore.recipeFavorites.contains(recipe) ? .pink : .primary)
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
                        ForEach(recipe.ingredients.filter { viewStore.searchIngredients.contains($0) }) { ingredient in
                            IngredientView(
                                ingredient: ingredient,
                                selected: viewStore.searchIngredients.contains(ingredient)
                            )
                        }
                        ForEach(recipe.ingredients.filter { !viewStore.searchIngredients.contains($0)  }) { ingredient in
                            IngredientView(
                                ingredient: ingredient,
                                selected: viewStore.searchIngredients.contains(ingredient)
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
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical)
                    }
                }
                .padding()
            }
            .gesture(
                DragGesture()
                    .onEnded {
                        if $0.translation.width > 100 {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
            )
        }
    }
}

struct SelectedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRecipeView(store: Root.defaultStore, recipe: Recipe.allRecipes.first!)
    }
}
