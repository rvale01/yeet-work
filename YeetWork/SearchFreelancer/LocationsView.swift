//
//  LocationsView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 28/01/2023.
//

import SwiftUI

struct LocationsView: View {
    @State private var selected_country = ""
    @State var onNext: (String) -> Void
    @State var onBack: () -> Void
    var body: some View {
        VStack {
            Text("Country")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                .multilineTextAlignment(.center)
                
                Picker(selection: $selected_country, label: Text("Select")) {
                    ForEach(countries, id: \.self) { country in
                        Text(country)
                        }
                    }
                .accentColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                Spacer()
                Button(action: {onNext(selected_country)}){
                    Text("Next")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.vertical, 20.0)
                        .padding(.horizontal, 100.0)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9647058823529412, green: 0.5764705882352941, blue: 0.34901960784313724)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(30)
                        .padding(.bottom, 10.0)
                }
                Button(action: onBack){
                Text("Back")
                    .fontWeight(.bold)
                    .padding(.vertical, 20.0)
                    .padding(.bottom, 10.0)
                    .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
            }

            
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(onNext: {location in print("okok")}, onBack: {print("back")})
    }
}
