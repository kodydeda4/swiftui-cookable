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
        case apple = "Apple"
        case orange = "Orange"
        case bananna = "Bananna"
    }
}


//Color(.secondarySystemGroupedBackground)
