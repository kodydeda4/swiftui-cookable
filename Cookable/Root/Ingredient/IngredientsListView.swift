//
//  IngredientsListView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct IngredientsList: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),], spacing: 20) {
                ForEach(viewStore.ingredientsList) { ingredient in
                    IngredientView(ingredient: ingredient) {
                        viewStore.send(.toggleIngredient(ingredient))
                    }
                }
            }
            .animation(.spring())
        }
    }
}


struct IngredientsListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsList(store: Root.defaultStore)
    }
}
