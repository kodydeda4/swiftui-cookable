//
//  RecipeLargeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct RecipeLargeView: View {
    let recipe: Recipe
    
    var body: some View {
        Text(recipe.name)
    }
}
struct RecipeLargeView_Previews: PreviewProvider {    
    static var previews: some View {
        RecipeLargeView(recipe: Recipe.allRecipes.first!)
    }
}
