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
                HStack {
                    Text("Ingredients")
                    .font(.title)
                    .bold()
                    
                    Spacer()
                    Button(action: { viewStore.send(.clearButtonTapped) }) {
                        Text("Clear All")
                            .disabled(viewStore.ingredientsList.isEmpty)
                    }
                }
                Divider()

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
                    viewStore.send(.searchButtonTapped)
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 40)
                        .foregroundColor(viewStore.ingredientsList.isEmpty ? .gray : .blue)
                        .overlay(
                            Text(viewStore.ingredientsList.isEmpty ? "Cancel" : "Search")
                                .foregroundColor(.white)
                        )
                        .animation(.spring(), value: viewStore.ingredientsList)
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
