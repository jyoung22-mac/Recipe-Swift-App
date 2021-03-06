//
//  ContentView.swift
//  Recipe List App
//
//  Created by Justin Young on 2021-04-13.
//

import SwiftUI

struct RecipeListView: View {
    // Reference the view model 
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack (alignment: .leading) {
            
            ForEach(model.recipes) { r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe:r),
                    label: {
                        
                        // MARK: Row item
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            VStack (alignment: .leading) {
                            Text(r.name)
                                .foregroundColor(.black)
                                .bold()
                                RecipeHighlights(highlights: r.highlights)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.leading)
                    })
                
                
                
            }
                }
            .navigationBarTitle("All Recipes")
        }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
