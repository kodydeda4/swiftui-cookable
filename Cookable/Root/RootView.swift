//
//  RootView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

// MARK:- RootView
struct RootView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            TabView {
                AboutView(store: store)
                    .tabItem { Label("About", systemImage: "gear") }
                SearchView(store: store)
                    .tabItem { Label("Search", systemImage: "magnifyingglass") }
                FavoritesView(store: store)
                    .tabItem { Label("Favorites", systemImage: "star.fill") }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}
