//
//  RecipeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

//struct RecipeView: View {
//    let recipe: Recipe
//    var isFavorited: Bool
//    
//    var body: some View {
//        VStack {
//            Image(recipe.imageName)
//                .resizable()
//                .scaledToFill()
//                //.frame(height: 200)
//                .clipped()
//                .overlay(
//                    RadialGradient(
//                        gradient: Gradient(colors: [.clear, .black]),
//                        center: .center,
//                        startRadius: 500,
//                        endRadius: 800
//                    )
//                    .opacity(0.6)
//                    .blendMode(.darken)
//                )
//                .overlay(
//                    VStack {
//                        Spacer()
//                        HStack {
//                            Text(recipe.name)
//                                .font(.largeTitle)
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//
//                            Spacer()
//                            Image(systemName: "star.fill")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 25, height: 25)
//                                .foregroundColor(.yellow)
//                                .opacity(isFavorited ? 1 : 0)
//                                
//                        }
//                        .padding()
//                        .shadow(radius: 4)
//                    }
//                )
//            
//            Text(recipe.description)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//                .lineLimit(1)
//                .padding()
//
////            HStack {
////                VStack(alignment: .leading) {
////                    Text(recipe.name)
////                        .font(.subheadline)
////                        .fontWeight(.semibold)
////                        .foregroundColor(.primary)
////
////                    Text(recipe.description)
////                        .font(.caption)
////                        .foregroundColor(.secondary)
////                        .lineLimit(1)
////                }
////                .padding([.horizontal, .bottom])
////                Spacer()
////            }
//        }
//        //.background(Color(.secondarySystemGroupedBackground))
//        //.clipShape(RoundedRectangle(cornerRadius: 10))
//        //.shadow(radius: 4, y: 4)
//    }
//}



//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeView(recipe: Recipe.allRecipes.first!, isFavorited: true)
//        RecipeView(recipe: Recipe.allRecipes.first!, isFavorited: false)
//    }
//}
