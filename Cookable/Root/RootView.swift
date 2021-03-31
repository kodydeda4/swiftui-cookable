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
                AboutView()
                    .tabItem { Label("About", systemImage: "gear").foregroundColor(.accentColor) }
                //SearchView(store: store)
                SearchView(store: store)
                    .tabItem { Label("Search", systemImage: "magnifyingglass").foregroundColor(.accentColor) }
                FavoritesView(store: store)
                    .tabItem { Label("Favorites", systemImage: "heart").foregroundColor(.accentColor) }
                    
            }
            .sheet(isPresented: viewStore.binding(keyPath: \.onboarding, send: Root.Action.keyPath)
            ) {
                OnboardingView(store: store)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}
