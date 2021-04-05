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
        description: "Description of fruit salad",
        ingredients: [.apple,.orange,.bananna],
        imageName: "fruit_salad",
        steps: [
            "Step 1",
            "Step 2",
            "Step 3",
            "Step 4",
            "Step 5",
        ]
    )
}
