//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

// TODO: Fix tapping out of bounds

struct SearchResultsView: View {
    let store: Store<Root.State, Root.Action>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                if viewStore.selectedRecipe == nil {
                    LazyVGrid(
                        columns: [GridItem](repeating: .init(.flexible()), count: 4),
                        spacing: 20
                    ) {
                        ForEach(viewStore.ingredientsList) { ingredient in
                            IngredientButtonView(ingredient: ingredient, selected: true) {
                                viewStore.send(.toggleIngredient(ingredient))
                            }
                        }
                    }
                    .padding()

                    ScrollView {
                        ForEach(viewStore.searchResults) { recipe in
                            VStack(alignment: .leading, spacing: 0) {
                                VStack(alignment: .leading) {
                                    Spacer()
                                    HStack {
                                        Text(recipe.name)
                                            .font(.title)
                                            .bold()
                                            //.frame(maxWidth: .infinity)
                                            .padding()
                                            .foregroundColor(.white)
                                            .shadow(radius: 4)
                                        Spacer()
                                    }
                                }
                                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                                .background(Color.gray)
//                                .background(
//                                    Image(recipe.imageName)
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .overlay(
//                                            RadialGradient(
//                                                gradient: Gradient(colors: [.clear, .black]),
//                                                center: .center,
//                                                startRadius: 4,
//                                                endRadius: 400
//                                            )
//                                            .opacity(0.4)
//                                        )
//                                )
                                .clipped()
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(recipe.description)
                                            .lineLimit(1)
                                    }
                                    .foregroundColor(.secondary)
                                    Spacer()
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(.tertiarySystemBackground))
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .onTapGesture { viewStore.send(.updateSelectedRecipe(recipe)) }
                            .padding()
                            .shadow(color: Color.black.opacity(0.3), radius: 20, y: 10)
                        }
                        
                    }
                } else {
                    SelectedRecipeView(
                        recipe: viewStore.selectedRecipe!,
                        action: { viewStore.send(.toggleFavorited(viewStore.selectedRecipe!)) },
                        favorited: viewStore.favoritedRecipes.contains(viewStore.selectedRecipe!)
                    )
                    .onTapGesture { viewStore.send(.updateSelectedRecipe(nil)) }
                }
            }
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static let mockStore = Store(
        initialState: Root.State(searchResults: Recipe.allRecipes, ingredientsList: Recipe.Ingredient.allCases),
        reducer:      Root.reducer,
        environment:  Root.Environment()
    )
    static var previews: some View {
        SearchResultsView(store: mockStore)
        SearchResultsView(store: Root.defaultStore)
    }
}
