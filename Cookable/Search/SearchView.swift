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
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                if viewStore.showingSearchResults {
                    SearchResultsView(store: store)
                } else {
                    EmptySearchResultsView(emptyIngredientsList: viewStore.ingredientsList.isEmpty) {
                        viewStore.send(.toggleSheet)
                    }
                }
            }
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

struct SearchView_Previews: PreviewProvider {
    static let mockStore = Store(
        initialState: Root.State(
            searchResults: Recipe.allRecipes,
            ingredientsList: [.apple]
        ),
        reducer:      Root.reducer,
        environment:  Root.Environment()
    )
    
    static var previews: some View {
        SearchView(store: mockStore)
    }
}
