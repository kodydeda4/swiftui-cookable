//
//  Recipe.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import Foundation

struct Recipe: Equatable, Identifiable {
    var id: String { self.name }
    
    var name: String
    var description: String
    var ingredients: [Ingredient]
    var favorite = false
    
    enum Ingredient: String, Identifiable, CaseIterable {
        var id: Ingredient { self }
        case chicken
        case beef
        case fish
        case shrimp
        
        case cheese
        case pasta
        case potatoes
        case spaghetti
        case soup
        
        case apple
        case orange
        case bananna
        case pear
        case fig
    }
}

extension Recipe {
    static var allRecipes: [Recipe] {
        [
            Recipe(name: "Apples", description: "Description of apples", ingredients: [.apple]),
            Recipe(name: "Bannas", description: "Description of bannanas", ingredients: [.apple]),
            Recipe(name: "Fruit Salad", description: "Description of fruit salad", ingredients: [.apple, .bananna, .orange]),
        ]
    }
}
