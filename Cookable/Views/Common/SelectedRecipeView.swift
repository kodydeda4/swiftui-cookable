//
//  RecipeLargeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct SelectedRecipeView: View {
    let recipe: Recipe
    let ingredientsList: [Recipe.Ingredient]
    var toggleFavoriteAction: () -> Void
    var toggleSelectedAction: () -> Void
    
    
    
    var favorited: Bool
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading) {
                    // img stuff
                }
                .frame(maxWidth: .infinity, minHeight: 500, maxHeight: 500)
                .background(
                    Image(recipe.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
                .clipShape(Rectangle())
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(recipe.name)
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        Button(action: toggleFavoriteAction) {
                            Image(systemName: favorited ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(favorited ? .pink : .primary)
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
                        ForEach(recipe.ingredients.filter { ingredientsList.contains($0)  }) { ingredient in
                            IngredientView(ingredient: ingredient, selected: ingredientsList.contains(ingredient))
                        }
                        ForEach(recipe.ingredients.filter { !ingredientsList.contains($0)  }) { ingredient in
                            IngredientView(ingredient: ingredient, selected: ingredientsList.contains(ingredient))
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .gesture(
            DragGesture()
                .onEnded {
                    if $0.translation.width < -100 {
                        toggleSelectedAction()
                    } else if $0.translation.width > 100 {
                        toggleSelectedAction()
                    }
                }
        )
    }
}

struct SelectedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRecipeView(recipe: Recipe.allRecipes.first!, ingredientsList: Recipe.Ingredient.allCases, toggleFavoriteAction: {}, toggleSelectedAction: {}, favorited: false)
        SelectedRecipeView(recipe: Recipe.allRecipes.first!, ingredientsList: Recipe.Ingredient.allCases, toggleFavoriteAction: {}, toggleSelectedAction: {}, favorited: true)
    }
}
