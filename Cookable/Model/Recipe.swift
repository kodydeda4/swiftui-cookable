//
//  Recipe.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import Foundation

struct Recipe: Codable, Equatable, Identifiable {
    var id: String { self.name }
    
    var name: String
    var description: String
    var ingredients: [Ingredient]
    var imageName: String
    var instructions: [String]
}

extension Recipe {
    static var allRecipes: [Recipe] {
        [
            applePie,
            banannaPudding,
            fruitSalad,
            chickenDinner,
            tomatoSoup
        ]
    }
}



// 1. Copy
