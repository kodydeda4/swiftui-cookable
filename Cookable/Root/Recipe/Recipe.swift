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
    var imageName: String
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
            Recipe(name: "Apple Pie",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                   ingredients: [.apple], imageName: "apple_pie"),
            
            
            Recipe(name: "Banna Pudding", description: "Description of bannana pudding", ingredients: [.bananna], imageName: "bananna_pudding"),
            Recipe(name: "Fruit Salad", description: "Description of fruit salad", ingredients: [.apple, .bananna, .orange], imageName: "fruit_salad"),
        ]
    }
}
