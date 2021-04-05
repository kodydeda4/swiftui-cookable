//
//  RootView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            TabView {
                AboutTabView()
                    .tabItem { Label("About", systemImage: "gear").foregroundColor(.accentColor) }
                SearchTabView(store: store)
                    .tabItem { Label("Search", systemImage: "magnifyingglass").foregroundColor(.accentColor) }
                FavoritesTabView(store: store)
                    .tabItem { Label("Favorites", systemImage: "heart").foregroundColor(.accentColor) }
            }
            .introspectTabBarController { (UITabBarController) in
                UITabBarController.tabBar.isHidden = false
            }
            .sheet(isPresented: viewStore.binding(keyPath: \.onboarding, send: Root.Action.keyPath)) {
                OnboardingView(store: store)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}
