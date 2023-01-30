//
//  BoxView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 26/01/2023.
//

import SwiftUI

struct BoxView: View {
    var title: String;
    var subtitle1: String;
    var subtitle2: String;
    
    var body: some View{
        VStack{
            Text(title)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                .frame(minWidth: 150.0, minHeight: 60.0)
                .padding(.horizontal, 5.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.8509803921568627, blue: 0.7607843137254902)/*@END_MENU_TOKEN@*/)
            
            Text(subtitle1)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.4745098039215686, green: 0.4745098039215686, blue: 0.4745098039215686))
                .multilineTextAlignment(.leading)
            
            Text(subtitle2)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.4745098039215686, green: 0.4745098039215686, blue: 0.4745098039215686))
                .padding(.bottom, 20.0)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 5.0)
        }
        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 0.9647058823529412, green: 0.5764705882352941, blue: 0.34901960784313724), lineWidth: 2)
        )
    }
}


struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        BoxView(title: "title", subtitle1: "subtitle", subtitle2: "subtitle2")
    }
}
