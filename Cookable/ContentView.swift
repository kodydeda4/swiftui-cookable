//
//  ContentView.swift
//  Cookable
//
//  Created by Kody Deda on 3/15/21.
//

import SwiftUI

struct ContentView: View {
    let groupMembers = [
        "Kody Deda",
        "Zane Bernard",
        "Zachary Mitzke",
        "Robin Wood",
        "Paolo Imperio",
    ]
    
    var body: some View {
        NavigationView {
            List(groupMembers, id: \.self) {
                Text($0)
            }
            .navigationBarTitle("Team Members")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
