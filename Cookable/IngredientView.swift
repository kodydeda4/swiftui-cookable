//
//  IngredientView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI

struct IngredientView: View {
    let ingredient: Recipe.Ingredient
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(ingredient.rawValue)
                .font(.caption)
                .foregroundColor(.secondary)
            Spacer()
            Button(action: action) {
                Image(systemName: "multiply.circle")
            }
        }
        .frame(width: 75)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 1, y: 0.5)
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient: .apple) {
            // code
        }
    }
}
