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
                ForEach(viewStore.recipes) { recipe in
                    NavigationLink(destination: Text("Hi")) {
                        VStack {
                            ZStack {
                                Image("apple_pie")
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
                                        Button(action: {viewStore.send(.toggleFavorited(recipe))}) {
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
                    .padding()
                }
            }
        }
    }
}

struct RecipesList_Previews: PreviewProvider {
    static var previews: some View {
        RecipesList(store: Root.defaultStore)
    }
}
