//
//  RecipeLargeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct RecipeLargeView: View {
    let recipe: Recipe
    var action: () -> Void
    var favorited: Bool
    
    var body: some View {
        Text(recipe.name)
        Button(action: action) {
            Image(systemName: favorited ? "star.fill" : "star")
                .foregroundColor(.yellow)
        }
    }
}
struct RecipeLargeView_Previews: PreviewProvider {    
    static var previews: some View {
        RecipeLargeView(recipe: Recipe.allRecipes.first!, action: {}, favorited: false)
        RecipeLargeView(recipe: Recipe.allRecipes.first!, action: {}, favorited: true)
    }
}
