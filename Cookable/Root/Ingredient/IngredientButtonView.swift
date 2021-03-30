//
//  AddIngredientView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct IngredientButtonView: View {
    let ingredient: Recipe.Ingredient
    var selected = false
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(ingredient.rawValue)
                .font(.caption)
                .foregroundColor(selected ? .white : .secondary)
                .lineLimit(1)
                .frame(maxWidth: 90)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
        }
        .background(selected ? Color.blue : Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 1, y: 0.5)
    }
}

struct AddIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientButtonView(ingredient: .apple) {
            // code
        }
    }
}
