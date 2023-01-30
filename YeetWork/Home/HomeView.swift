//
//  View.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 12/01/2023.
//

import SwiftUI


struct ProfileView: View {
    var url: URL;
    var body: some View {
        AsyncImage(url: url){ res in
            res.image?
                .resizable()
                
        }
            .frame(width: 100, height: 100)
            .cornerRadius(50)
    }
}

struct HomeView: View {
    @State private var data: HomeInitData?
    @State private var isLoading = true
    
    var body: some View {
        ZStack{
            if(isLoading){
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }else{
                VStack{
                    Text("Home")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                        .multilineTextAlignment(.center)
                    Spacer()
                    PopularView(popularFreelancers: data?.most_popular)
                    Spacer()
                    ListBoxesView(title: "Highest ratings", freelancers: data?.highest_ratings)
                    Spacer()
                    ListBoxesView(title: "Verified users", freelancers: data?.verified_users)
                    Spacer()
                    Spacer()
                }
            }
        }.onAppear {
            getInitData(completion: {apiReturn in
                data = (apiReturn as! HomeInitData)
                isLoading = false
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
