//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct RecipesList: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ScrollView {
                ForEach(viewStore.searchResults) { recipe in
                    NavigationLink(destination: RecipeViewLarge(recipe: recipe)) {
                        RecipeView(recipe: recipe, action: { viewStore.send(.toggleFavorited(recipe)) })
                    }
                    .padding()
                }
            }
        }
    }
}

struct RecipeView: View {
    let recipe: Recipe
    var action: () -> Void
    
    var body: some View {
        VStack {
            ZStack {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFill()
                    .overlay(Color.black.opacity(0.25).blendMode(.overlay))
                
                VStack {
                    HStack {
                        Text(recipe.name)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .shadow(radius: 6)
                        Spacer()
                        Button(action: action) {
                            Image(systemName: recipe.favorite ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            Text(recipe.description)
                .padding()
        }
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 6, y: 6)

    }
}

struct RecipeViewLarge: View {
    let recipe: Recipe
    
    var body: some View {
        Text(recipe.name)
    }
}

struct RecipesList_Previews: PreviewProvider {
    static var previews: some View {
        RecipesList(store: Root.defaultStore)
    }
}
