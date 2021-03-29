//
//  AboutView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct AboutView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List {
                    Section(header: Text("UNCW Fall 2021")) {
                        Text("CSC 450 - Software Engineering")
                        Text("Dr Ralph Bradley")
                    }
                    Section(header: Text("Team Members")) {
                        ForEach(viewStore.groupMembers, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("About")
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(store: Root.defaultStore)
    }
}
