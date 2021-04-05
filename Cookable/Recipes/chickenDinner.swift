//
//  chickenDinner.swift
//  Cookable
//
//  Created by Kody Deda on 4/5/21.
//

import Foundation

extension Recipe {
    static let chickenDinner = Recipe(
        name: "Chicken, Apple, and Brussels Sprout Sheet Pan Dinner",
        description: "If you're looking for the easiest dinner imaginable (short of takeout), sheet pan recipes are the perfect thing for you. This one, with chicken, apple, and Brussels sprouts, is not only easy to cook, but even easier to clean! Serve it alone or with rice/salad.",
        ingredients: [.apple, .oliveOil, .chicken, .pepper, .rosemary],
        imageName: "chickenDinner",
        steps: [
            "Preheat the oven to 425 degrees F (220 degrees C)",
            "Toss Brussels sprouts, apple, and pancetta with 1 tablespoon olive oil and rosemary in a bowl. Spread into a single layer on a sheet pan.",
            "Leave space on the pan for the chicken thighs. Toss chicken with the remaining 1 tablespoon oil in the same bowl; place on the sheet pan. Sprinkle salt and pepper on top.",
            "Bake in the preheated oven, stirring the Brussels sprouts mixture every 15 minutes, until chicken is no longer pink in the center and the juices run clear, 40 to 45 minutes. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C).",
        ]
    )
}
