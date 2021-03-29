//
//  SearchView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct SearchView: View {
    let store: Store<Root.State, Root.Action>
    @State var displaySheet = false
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                if viewStore.searchResults.isEmpty || viewStore.ingredientsList.isEmpty {
                    VStack {
                        Text(viewStore.ingredientsList.isEmpty ? "Start Searching": "No Results Found")
                            .font(.title)
                            .foregroundColor(Color(.gray))
                            .navigationBarTitle("Search")

                        Button("Add Ingredients") {
                            viewStore.send(.toggleSheet)
                        }
                        .padding()
                    }
                } else {
                    VStack {
                        IngredientsList(store: store).padding()
                        RecipesList(store: store)
                    }
                    .navigationBarTitle("Search")
                    .toolbar {
                        ToolbarItem {
                            Button(action: { viewStore.send(.toggleSheet) }) {
                                Text("Add Ingredients")
                            }
                        }
                        ToolbarItem {
                            Button(action: { viewStore.send(.clearButtonTapped) }) {
                                Text("Clear")
                            }
                        }
                    }
                }
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(store: Root.defaultStore)
    }
}
