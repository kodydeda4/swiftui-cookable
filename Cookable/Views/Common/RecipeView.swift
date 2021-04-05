//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 4/2/21.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    var favorited = false
    
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
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.pink)
                                .frame(width: 30, height: 30)
                                .opacity(favorited ? 1 : 0)
                            
                        }
                        Spacer()
                    }
                    .padding()
                    .shadow(radius: 3)
                )
            
            Spacer()
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                
                Text(recipe.description)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                HStack {
                    Spacer()
                    Text("Read More")
                        .foregroundColor(.accentColor)
                        .padding(.top, 2)
                }
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
