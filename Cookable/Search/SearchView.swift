//
//  SearchView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct SearchHomepageView: View {
    var emptyIngredientsList = true
    var action: () -> Void
    
    var body: some View {
        VStack {
            Text(emptyIngredientsList ? "Start Searching": "No Results Found")
                .font(.title)
                .foregroundColor(Color(.gray))
            
            Button("Add Ingredients") {
                action()
            }
            .padding()
        }
    }
}

struct SearchView: View {
    let store: Store<Root.State, Root.Action>
    @State var displaySheet = false
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                if viewStore.showingRecipeResults {
                    RecipesList(store: store)
                } else {
                    SearchHomepageView(emptyIngredientsList: viewStore.ingredientsList.isEmpty) {
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
            ingredientsList: [.apple]//Recipe.Ingredient.allCases
        ),
        reducer:      Root.reducer,
        environment:  Root.Environment()
    )
    
    static var previews: some View {
        SearchView(store: mockStore)
    }
}
