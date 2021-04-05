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
    var steps: [String]
    
    enum Ingredient: String, Codable, Identifiable, CaseIterable {
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
        
        case butter
        case flour
        case cinnamon
        case nutmeg
        case lemonZest
        case lemonJuice
        case sugar
        case milk
        
        case salt
        case eggs
        case vanilla
        
        case oliveOil
        case pepper
        case rosemary
    }
}

extension Recipe {
    static var allRecipes: [Recipe] {
        [
            applePie,
            banannaPudding,
            fruitSalad,
            chickenDinner
        ]
    }
}
