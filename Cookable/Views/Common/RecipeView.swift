//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 4/2/21.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Color.clear
                .frame(height: 200)
                .overlay(
                    Image(recipe.imageName)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                )
                .clipShape(Rectangle())
            
            Spacer()
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                
                Text(recipe.description.uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.trailing, 6)
            .padding(.vertical, 8)
            
        }
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.allRecipes.first!)
    }
}
