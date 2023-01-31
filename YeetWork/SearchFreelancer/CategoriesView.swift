//
//  CategoriesView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 28/01/2023.
//

import SwiftUI

// This view allows the user to choose any category they want.
// The categories are wrapped is wrapped inside a ScrollView to allow scrolling when they exceed the screen space
// by clicking each category, a the onSelect is called, where the category is passed. This action will switch screen to be displayed

// The view accepts as paramter the onSelect function

struct CategoriesView: View {
    @State var onSelect: (String) -> Void
    
    var body: some View {
        VStack {
            Text("Categories")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                .multilineTextAlignment(.center)
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                onSelect(category)
                            }) {
                                Text(category)
                                    .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                                    .frame(width: 107, height: 107)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.8509803921568627, blue: 0.7607843137254902)/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(15)
                            }
                        }
                    }
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(onSelect: {category in print("ok")})
    }
}
