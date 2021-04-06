//
//  fruitSalad.swift
//  Cookable
//
//  Created by Kody Deda on 4/5/21.
//

import Foundation
import SwiftUI

extension Recipe {
    static let fruitSalad = Recipe(
        name: "Fruit Salad",
        description: "In a hurry? Make this fruit salad in about 10 minutes. You can add or subtract different fruit according to your taste and what is in season.",
        ingredients: [.apple,.orange,.bananna],
        imageName: "fruit_salad",
        instructions: [
            "In a large bowl, combine the strawberries, grapes, kiwis, and bananas. Gently mix in peaches. Chill for 1 hour before serving.",
        ]
    )
}
