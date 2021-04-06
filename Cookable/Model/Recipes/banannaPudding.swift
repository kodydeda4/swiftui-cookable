//
//  banannaPudding.swift
//  Cookable
//
//  Created by Kody Deda on 4/5/21.
//

import Foundation

extension Recipe {
    static let banannaPudding = Recipe(
        name: "Banna Pudding",
        description: "This is a recipe that's been handed down from my grandmother. My whole family loves it and we all grew up on it! Hope you enjoy it!",
        ingredients: [.bananna, .sugar, .flour, .salt, .eggs, .milk, .vanilla, .butter],
        imageName: "bananna_pudding",
        instructions: [
            "In medium saucepan combine sugar, flour, and salt. Add eggs and stir well. Stir in milk, and cook over low heat, stirring constantly. When mixture begins to thicken, remove from heat and continue to stir, cooling slightly. Stir in vanilla and butter until smooth.",
            "Layer pudding with bananas and vanilla wafers in a serving dish. Chill at least one hour in refrigerator before serving.",
        ]
    )
}
