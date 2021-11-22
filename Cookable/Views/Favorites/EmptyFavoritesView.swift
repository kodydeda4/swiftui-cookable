//
//  EmptyFavoritesView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct EmptyFavoritesView: View {
  var body: some View {
    VStack {
      Image(systemName: "heart.text.square")
        .resizable()
        .scaledToFit()
        .frame(width: 50)
        .foregroundColor(Color(.gray))
      
      Text("Favorites List")
        .font(.largeTitle)
        .foregroundColor(Color(.gray))
    }
    .navigationBarTitle("Favorites")
  }
}

struct EmptyFavoritesView_Previews: PreviewProvider {
  static var previews: some View {
    EmptyFavoritesView()
  }
}
