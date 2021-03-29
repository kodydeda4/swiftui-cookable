//
//  FavoritesView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct FavoritesView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) {viewStore in
            NavigationView {
                if viewStore.favoritedRecipes.count == 0 {
                    Text("Empty")
                        .font(.title)
                        .foregroundColor(Color(.gray))
                        .navigationBarTitle("Favorites")
                } else {
                    List {
                        ForEach(viewStore.favoritedRecipes) { recipe in
                            HStack {
                                Text(recipe.name)
                                Spacer()
                                Button("Remove") { viewStore.send(.toggleFavorited(recipe)) }
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("Favorites")
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(store: Root.defaultStore)
    }
}
