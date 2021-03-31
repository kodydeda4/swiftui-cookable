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
                    .padding(.top)
                    .padding(.top)
                
                Text("Welcome to Cookable")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Description about app goes here")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.top, 1)
                
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
                                .frame(width: 36)//, height: 36)
                                .padding(.trailing)
                            
                            VStack(alignment: .leading) {
                                Text(feature.name)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                
                                Text(feature.description)
                                    //.font(.body)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                    }
                }
                .padding(.top)
                .padding()
                
                
                Spacer()
                
                Text("Kody | Zane | Zach | Robin | Paolo")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                    .font(.caption)
                
                Button(action: {
                    viewStore.send(.toggleOnboaring)
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .foregroundColor(.accentColor)
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

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(store: Root.defaultStore)
    }
}
