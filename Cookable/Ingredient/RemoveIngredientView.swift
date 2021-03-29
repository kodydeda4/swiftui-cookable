//
//  IngredientView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI

struct RemoveIngredientView: View {
    let ingredient: Recipe.Ingredient
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(ingredient.rawValue)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
            Spacer()
            Button(action: action) {
                Image(systemName: "multiply.circle")
            }
        }
        .frame(maxWidth: 90)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 1, y: 0.5)
    }
}

struct RemoveIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveIngredientView(ingredient: .apple) {
            // code
        }
    }
}


