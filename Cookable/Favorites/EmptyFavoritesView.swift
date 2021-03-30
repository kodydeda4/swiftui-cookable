//
//  EmptyFavoritesView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct EmptyFavoritesView: View {
    var body: some View {
        Text("Empty")
            .font(.title)
            .foregroundColor(Color(.gray))
            .navigationBarTitle("Favorites")
    }
}

struct EmptyFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFavoritesView()
    }
}
