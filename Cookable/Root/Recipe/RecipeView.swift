//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe
    var favorited: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Text(recipe.name)
                        .font(.title)
                        .bold()
                        //.frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
            .background(
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(
                        RadialGradient(
                            gradient: Gradient(colors: [.clear, .black]),
                            center: .center,
                            startRadius: 4,
                            endRadius: 400
                        )
                        .opacity(0.4)
                    )
            )
            .clipped()
            HStack {
                VStack(alignment: .leading) {
                    Text(recipe.description)
                        .lineLimit(1)
                }
                .foregroundColor(.secondary)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.tertiarySystemBackground))
        }
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding()
        .shadow(color: Color.black.opacity(0.3), radius: 20, y: 10)
    }
}



struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.allRecipes.first!, favorited: true)
        RecipeView(recipe: Recipe.allRecipes.first!, favorited: false)
    }
}
