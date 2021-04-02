//
//  SheetView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct SearchSheetView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading) {
                HStack {
                    Text("My Ingredients")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    Button(action: { viewStore.send(.clearButtonTapped) }) {
                        Text("Clear All")
                            .disabled(viewStore.ingredientsList.isEmpty)
                    }
                }
                Divider()
                    .padding(.bottom)
                
                ScrollView {
                    LazyVGrid(
                        columns: [GridItem](repeating: .init(.flexible()), count: 4),
                        spacing: 20
                    ) {
                        ForEach(Recipe.Ingredient.allCases) { ingredient in
                            Button(action: { viewStore.send(.toggleIngredient(ingredient)) }) {
                                IngredientView(
                                    ingredient: ingredient,
                                    selected: viewStore.ingredientsList.contains(ingredient)
                                )
                            }
                        }
                    }
                }
            }
            Spacer()
            Button(action: {
                viewStore.send(.searchButtonTapped)
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 50)
                    //.background(selected ? Color.accentColor : Color(.secondarySystemBackground))
                    .foregroundColor(viewStore.ingredientsList.isEmpty ? Color(.secondarySystemBackground) : .accentColor)
                    .overlay(Text(viewStore.ingredientsList.isEmpty ? "Cancel" : "Search").foregroundColor(
                        viewStore.ingredientsList.isEmpty ? .secondary : .white
                    )
                    )
            }
        }
        .animation(.easeInOut)
        .padding()
    }
}


struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheetView(store: Root.defaultStore)
    }
}
