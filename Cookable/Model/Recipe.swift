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
  var instructions: [String]
}

extension Recipe {
  static var allRecipes: [Recipe] {[
    Recipe(
      name: "Apple Pie",
      description: "This is a sweet, tart and delicious apple pie. Guaranteed to please. Be sure to use Granny Smith apples since they work the best.",
      ingredients: [.butter, .flour, .cinnamon, .nutmeg, .lemonZest, .apple, .lemonJuice, .sugar, .milk],
      imageName: "apple_pie",
      instructions: [
        "Preheat oven to 425 degrees F (220 degrees C).",
        "Mix together the sugar, flour, cinnamon, nutmeg and lemon peel.",
        "Line one crust in a 9-inch deep-dish pie pan. Layer 1/3 of apples into pie crust. Sprinkle with sugar mixture and repeat until done. Sprinkle with lemon juice and dot with butter.",
        "Place second pie crust on top of filling and flute the edges. Cut vents in top crust and brush with milk for a glazed appearance if desired.",
        "Bake at 425 degrees F (220 degrees C) for 40 to 50 minutes.",
      ]
    ),
    Recipe(
      name: "Tomato Soup",
      description: "Quick and creamy tomato soup with pesto. You can spice this up with hot sauce or chile oil if you like it hot.",
      ingredients: [.chickenBroth, .driedTomatos, .basil, .garlic],
      imageName: "tomatoSoup",
      instructions: [
        "Pour chicken broth into a large saucepan, and bring to a boil. Boil until reduced by about 1/3.",
        "Pour in both cans of the tomatoes, and return to a simmer. Pour in the half-and-half, and turn heat to low. Simmer for 15 minutes. Puree in batches in a blender, or use an immersion blender in the pan. Season with salt and pepper to taste. Ladle into bowls, and swirl in a spoonful of pesto before serving."
      ]
    ),
    Recipe(
      name: "Banna Pudding",
      description: "This is a recipe that's been handed down from my grandmother. My whole family loves it and we all grew up on it! Hope you enjoy it!",
      ingredients: [.bananna, .sugar, .flour, .salt, .eggs, .milk, .vanilla, .butter],
      imageName: "bananna_pudding",
      instructions: [
        "In medium saucepan combine sugar, flour, and salt. Add eggs and stir well. Stir in milk, and cook over low heat, stirring constantly. When mixture begins to thicken, remove from heat and continue to stir, cooling slightly. Stir in vanilla and butter until smooth.",
        "Layer pudding with bananas and vanilla wafers in a serving dish. Chill at least one hour in refrigerator before serving.",
      ]
    ),
    Recipe(
      name: "Fruit Salad",
      description: "In a hurry? Make this fruit salad in about 10 minutes. You can add or subtract different fruit according to your taste and what is in season.",
      ingredients: [.apple,.orange,.bananna],
      imageName: "fruit_salad",
      instructions: [
        "In a large bowl, combine the strawberries, grapes, kiwis, and bananas. Gently mix in peaches. Chill for 1 hour before serving.",
      ]
    ),
    Recipe(
      name: "Chicken, Apple, and Brussels Sprout Sheet Pan Dinner",
      description: "If you're looking for the easiest dinner imaginable (short of takeout), sheet pan recipes are the perfect thing for you. This one, with chicken, apple, and Brussels sprouts, is not only easy to cook, but even easier to clean! Serve it alone or with rice/salad.",
      ingredients: [.apple, .oliveOil, .chicken, .pepper, .rosemary],
      imageName: "chickenDinner",
      instructions: [
        "Preheat the oven to 425 degrees F (220 degrees C)",
        "Toss Brussels sprouts, apple, and pancetta with 1 tablespoon olive oil and rosemary in a bowl. Spread into a single layer on a sheet pan.",
        "Leave space on the pan for the chicken thighs. Toss chicken with the remaining 1 tablespoon oil in the same bowl; place on the sheet pan. Sprinkle salt and pepper on top.",
        "Bake in the preheated oven, stirring the Brussels sprouts mixture every 15 minutes, until chicken is no longer pink in the center and the juices run clear, 40 to 45 minutes. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C).",
      ]
    )
  ]}
}
