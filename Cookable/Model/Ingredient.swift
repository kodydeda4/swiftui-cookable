//
//  Ingredient.swift
//  Cookable
//
//  Created by Kody Deda on 4/6/21.
//

import Foundation

extension Recipe {
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
    
    case chickenBroth
    case driedTomatos
    case basil
    case garlic
    
    var description: String {
      rawValue.seperateUppercaseCharacters.lowercased()
    }
  }
}



