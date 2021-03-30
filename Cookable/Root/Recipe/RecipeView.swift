//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe
    var isFavorited: Bool
    
    var body: some View {
        VStack {
            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .opacity(isFavorited ? 1 : 0)
                                .padding(4)
                                .shadow(radius: 2)
                        }
                        Spacer()
                    }
                )
            HStack {
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text(recipe.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                .padding([.horizontal, .bottom])
                Spacer()
            }
        }
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4, y: 4)
    }
}
struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.allRecipes.first!, isFavorited: true)
        RecipeView(recipe: Recipe.allRecipes.first!, isFavorited: false)
    }
}
