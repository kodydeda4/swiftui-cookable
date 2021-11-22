//
//  SearchView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct SearchTabView: View {
  let store: Store<Root.State, Root.Action>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        VStack {
          if viewStore.isSearching {
            SearchResultsView(store: store)
          } else {
            EmptySearchResultsView(emptyIngredientsList: viewStore.searchIngredients.isEmpty) {
              viewStore.send(.toggleSearchSheet)
            }
          }
        }
        .navigationBarTitle("Cookable Results")
        .toolbar {
          ToolbarItem {
            Button("Ingredients") {
              viewStore.send(.toggleSearchSheet)
            }
          }
        }
        .sheet(isPresented: viewStore.binding(keyPath: \.sheet, send: Root.Action.keyPath)) {
          SearchSheetView(store: store)
        }
      }
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static let mockStore1 = Store(
    initialState: Root.State(recipeSearch: Recipe.allRecipes, searchIngredients: Recipe.Ingredient.allCases),
    reducer:      Root.reducer,
    environment:  Root.Environment()
  )
  static let mockStore2 = Store(
    initialState: Root.State(searchIngredients: Recipe.Ingredient.allCases),
    reducer:      Root.reducer,
    environment:  Root.Environment()
  )
  static var previews: some View {
    SearchTabView(store: Root.defaultStore)
    SearchTabView(store: mockStore1)
    SearchTabView(store: mockStore2)
  }
}
