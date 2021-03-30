//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe
    var action: () -> Void
    
    var body: some View {
        VStack {
            ZStack {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFill()
                    .overlay(Color.black.opacity(0.25).blendMode(.overlay))
                    .frame(maxHeight: 300)

                VStack {
                    HStack {
                        Text(recipe.name)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .shadow(radius: 6)
                        Spacer()
                        Button(action: action) {
                            Image(systemName: recipe.favorite ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            Text(recipe.description)
                .padding()
        }
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 6, y: 6)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.allRecipes.first!, action: {})
    }
}
