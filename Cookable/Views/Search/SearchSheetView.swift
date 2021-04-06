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
                    Button(action: { viewStore.send(.searchSheetClearAllButtonTapped) }) {
                        Text("Clear All")
                            .disabled(viewStore.searchIngredients.isEmpty)
                    }
                }
                Divider()
                    .padding(.bottom)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem](repeating: .init(.flexible()), count: 4), spacing: 20) {
                        ForEach(Recipe.Ingredient.allCases) { ingredient in
                            Button(action: { viewStore.send(.toggleSearchSheetIngredient(ingredient)) }) {
                                IngredientView(
                                    ingredient: ingredient,
                                    selected: viewStore.searchIngredients.contains(ingredient)
                                )
                            }
                        }
                    }
                }
            }
            Spacer()

            Button(action: {
                viewStore.send(.searchSheetSearchButtonTapped)
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 50)
                    .foregroundColor(viewStore.searchIngredients.isEmpty ? Color(.secondarySystemBackground) : .accentColor)
                    .overlay(
                        Text(viewStore.searchIngredients.isEmpty ? "Cancel" : "Search")
                            .foregroundColor(viewStore.searchIngredients.isEmpty ? .secondary : .white)
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
