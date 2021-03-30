//
//  Onboarding.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Spacer()
                Image("cookable")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .shadow(radius: 1.5, y: 1)
                
                Text("Welcome to Cookable")
                    .font(.title)
                    .fontWeight(.medium)
                
                Text("Cook with what you got")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading) {
                    ForEach([
                        Feature(
                            name: "Find Recipes",
                            image: Image(systemName: "magnifyingglass"),
                            description: "Based on your ingredients"
                        ),
                        Feature(
                            name: "Save Favorites",
                            image: Image(systemName: "star"),
                            description: "All in one organized place"
                        ),
                        Feature(
                            name: "Learn Skills",
                            image: Image(systemName: "heart.text.square"),
                            description: "Develop culinary skills by cooking"
                        ),
                    ]) { feature in
                        HStack {
                            feature.image
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.accentColor)
                                .frame(width: 24, height: 24)
                                .padding(.trailing, 2)
                            
                            VStack(alignment: .leading) {
                                Text(feature.name)
                                    .font(.headline)
                                    .fontWeight(.medium)
                                
                                Text(feature.description)
                                    .font(.body)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                    }
                }
                .padding()
                
                
                Spacer()
                
                Text("Kody | Zane | Zach | Robin | Paolo")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.caption)
                
                Button(action: {
                    viewStore.send(.toggleOnboaring)
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 40)
                        .foregroundColor(.blue)
                        .overlay(Text("Get Started").foregroundColor(.white))
                }
            }
            .padding()
        }
    }
}

struct Feature: Identifiable, Equatable {
    var id = UUID()
    let name: String
    let image: Image
    let description: String
}
