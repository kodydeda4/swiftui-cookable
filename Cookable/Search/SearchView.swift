//
//  SearchView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct SearchResultsView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                //                VStack {
                //                    if !viewStore.showingSearchResults {
                //                        EmptySearchResultsView(emptyIngredientsList: viewStore.ingredientsList.isEmpty) {
                //                            viewStore.send(.toggleSheet)
                //                        }
                //                    } else {
                
                //                        Text("Showing \(viewStore.searchResults.count) results")
                //                            .font(.caption)
                //                            .foregroundColor(.secondary)
                //                            .padding(.leading)
                //                            .lineLimit(1)
                VStack {
                    //Section(header: Text("Ingredients")) {
                    LazyVGrid(
                        columns: [GridItem](repeating: .init(.flexible()), count: 4),
                        spacing: 20
                    ) {
                        ForEach(viewStore.ingredientsList) { ingredient in
                            IngredientButtonView(ingredient: ingredient) {
                                viewStore.send(.toggleIngredient(ingredient))
                            }
                        }
                    }
                    .animation(.spring())
                    .padding()
                    
                    //                        Text("Test")
                    //.padding(.leading)
                    ScrollView {
                        //
                        ForEach(viewStore.searchResults) { recipe in
                            NavigationLink(
                                destination:
                                    RecipeLargeView(
                                        recipe: recipe,
                                        action: { viewStore.send(.toggleFavorited(recipe)) },
                                        favorited: viewStore.favoritedRecipes.contains(recipe)
                                    )
                            ) {
                                
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Text(recipe.name)
                                        .font(.title)
                                        .bold()
                                        .padding(.leading)
                                        .foregroundColor(.white)
                                        .shadow(radius: 4)
                                    
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(recipe.description)
                                                .lineLimit(1)
                                        }
                                        .foregroundColor(.secondary)
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    //.background(Color.black.opacity(0.8))
                                    .background(Color.white)
                                }
                                .frame(maxWidth: .infinity, minHeight: 250, maxHeight: 250)
                                .background(
                                    Image(recipe.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .overlay(
                                            RadialGradient(
                                                gradient: Gradient(colors: [.clear, .black]),
                                                center: .center,
                                                startRadius: 4,
                                                endRadius: 400
                                            )
                                            .opacity(0.4)
                                            
                                        )
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                .padding()
                                .shadow(color: Color.black.opacity(0.3), radius: 20, y: 10)
                            }
                            
                            
                            //                                Section(header: Text(recipe.name)) {
                            //
                            //                                    NavigationLink(
                            //                                        destination:
                            //                                            RecipeLargeView(
                            //                                                recipe: recipe,
                            //                                                action: { viewStore.send(.toggleFavorited(recipe)) },
                            //                                                favorited: viewStore.favoritedRecipes.contains(recipe)
                            //                                            )
                            //                                    ) {
                            //                                        Image(recipe.imageName)
                            //                                            .resizable()
                            //                                            .scaledToFill()
                            //                                            .frame(height: 200)
                            //                                            .clipped()
                            //                                    }
                            //                                }
                            //
                            //                                //.aspectRatio(CGSize(width: 16, height: 10), contentMode: .fill)
                        }
                    }
                    //                    }
                }
                .navigationBarTitle("Search Results")
                .toolbar {
                    ToolbarItem {
                        Button("Ingredients") {
                            viewStore.send(.toggleSheet)
                        }
                    }
                }
            }
            .sheet(isPresented: viewStore.binding(keyPath: \.sheet, send: Root.Action.keyPath)) {
                SheetView(store: store)
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
