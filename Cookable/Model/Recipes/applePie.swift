//
//  applePie.swift
//  Cookable
//
//  Created by Kody Deda on 4/5/21.
//

import Foundation

extension Recipe {
    static let applePie = Recipe(
        name: "Apple Pie",
        description: "This is a sweet, tart and delicious apple pie. Guaranteed to please. Be sure to use Granny Smith apples since they work the best.",
        ingredients: [.butter, .flour, .cinnamon, .nutmeg, .lemonZest, .apple, .lemonJuice, .sugar, .milk],
        imageName: "apple_pie",
        steps: [
            "Preheat oven to 425 degrees F (220 degrees C).",
            "Mix together the sugar, flour, cinnamon, nutmeg and lemon peel.",
            "Line one crust in a 9-inch deep-dish pie pan. Layer 1/3 of apples into pie crust. Sprinkle with sugar mixture and repeat until done. Sprinkle with lemon juice and dot with butter.",
            "Place second pie crust on top of filling and flute the edges. Cut vents in top crust and brush with milk for a glazed appearance if desired.",
            "Bake at 425 degrees F (220 degrees C) for 40 to 50 minutes.",
        ]
    )
}

