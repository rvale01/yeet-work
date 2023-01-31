//
//  AccountView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 12/01/2023.
//

import SwiftUI

struct PersonalImageView: View {
    var url: String;
    var body: some View {
        AsyncImage(url: URL(string: url))
        .frame(width: 150, height: 150)
        .cornerRadius(100)
    }
}

// This view shows an image with the logout button
struct AccountView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 30){
            PersonalImageView(url: "https://media.istockphoto.com/id/697083606/photo/clifton-village-with-suspension-bridge.jpg?s=612x612&w=is&k=20&c=QpF0p3y1o3LwJqPDLNVjXecUiD9s-zrGQ3f4kkbG8Rg=")
            Text("Hi, " + (userViewModel.user?.displayName ?? ""))
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Button(action: userViewModel.logout){
                    Text("Logout")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 20.0)
                    .padding(.horizontal, 100.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9647058823529412, green: 0.5764705882352941, blue: 0.34901960784313724)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(30)
                }
            Spacer()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
