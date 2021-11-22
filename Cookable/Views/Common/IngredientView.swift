//
//  AddIngredientView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct IngredientView: View {
  let ingredient: Recipe.Ingredient
  var selected = false
  
  var body: some View {
    Text(ingredient.description)
      .foregroundColor(selected ? .white : .secondary)
      .frame(maxWidth: 90)
      .lineLimit(1)
      .padding(.horizontal, 8)
      .padding(.vertical, 6)
      .background(selected ? Color.accentColor : Color(.secondarySystemBackground))
      .clipShape(Capsule())
  }
}

struct AddIngredientView_Previews: PreviewProvider {
  static var previews: some View {
    IngredientView(ingredient: .apple)
  }
}


