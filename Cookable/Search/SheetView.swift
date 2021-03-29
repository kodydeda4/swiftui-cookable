//
//  SheetView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct SheetView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.title)
                    .bold()

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),], spacing: 20) {
                        ForEach(Recipe.Ingredient.allCases) { ingredient in
                            AddIngredientView(
                                ingredient: ingredient,
                                selected: viewStore.ingredientsList.contains(ingredient)
                            ) {
                                viewStore.send(.toggleIngredient(ingredient))
                            }
                        }
                    }
                    .animation(.spring())
                }
                Spacer()
                Button(action: {
                    viewStore.send(.toggleSheet)
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 40)
                        .foregroundColor(.blue)
                        .overlay(
                            Text("Search")
                                .foregroundColor(.white)
                        )
                }
            }
            .padding()
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(store: Root.defaultStore)
    }
}
