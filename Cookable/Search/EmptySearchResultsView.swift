//
//  EmptySearchResultsView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct EmptySearchResultsView: View {
    var emptyIngredientsList = true
    var action: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: emptyIngredientsList ? "doc.text.magnifyingglass" : "questionmark.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundColor(Color(.gray))

            Text(emptyIngredientsList ? "Search Recipes": "No Results")
                .font(.largeTitle)
                .foregroundColor(Color(.gray))
                        
            Button("My Ingredients") {
                action()
            }
            .padding(.top, 4)
            
            
        }
        .navigationBarTitle("Search")
    }
}

struct EmptySearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        EmptySearchResultsView(emptyIngredientsList: false, action: {})
        EmptySearchResultsView(emptyIngredientsList: true, action: {})
    }
}
