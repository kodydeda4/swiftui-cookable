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
        ScrollView {
            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
            
            HStack {
                Button(action: action) {
                    Image(systemName: favorited ? "star.fill" : "star")
                }
                .foregroundColor(.yellow)
                
                Text(recipe.name)
                    .font(.largeTitle)
            }
            Text(recipe.description)
        }
        //.edgesIgnoringSafeArea(.top)
    }
}
struct RecipeLargeView_Previews: PreviewProvider {    
    static var previews: some View {
        RecipeLargeView(recipe: Recipe.allRecipes.first!, action: {}, favorited: false)
        RecipeLargeView(recipe: Recipe.allRecipes.first!, action: {}, favorited: true)
    }
}
