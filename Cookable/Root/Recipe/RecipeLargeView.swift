//
//  RecipeLargeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct GradientOverlay: View {
    var body: some View {
        VStack {
            LinearGradient(
                gradient: Gradient(colors: [.black, .clear]),
                startPoint: .top,
                endPoint: .bottom
            )
            .blendMode(.darken)
            .frame(height: 100)
            Spacer()
        }
    }
}


struct RecipeLargeView: View {
    let recipe: Recipe
    var action: () -> Void
    var favorited: Bool
    
    var body: some View {
        ScrollView {
            ZStack {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()

                //GradientOverlay()
                VStack {
                    HStack {
                        Text(recipe.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Button(action: action) {
                            Image(systemName: favorited ? "star.fill" : "star")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.yellow)
                                .frame(width: 30, height: 30)
                        }
                    }
                    Spacer()
                }
                .padding()
                .padding(.top)
                .shadow(radius: 30)
            }
            .clipShape(Rectangle())
            
            
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Divider()
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),], spacing: 20) {
                    ForEach(recipe.ingredients) { ingredient in
                        IngredientButtonView(ingredient: ingredient) {
                            //
                        }
                    }
                }
                .animation(.spring())
                
                Divider()
                
                Text(recipe.description)
            }
            .padding(.horizontal)
        }
    }
}
struct RecipeLargeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeLargeView(recipe: Recipe.allRecipes.first!, action: {}, favorited: false)
        RecipeLargeView(recipe: Recipe.allRecipes.first!, action: {}, favorited: true)
    }
}
