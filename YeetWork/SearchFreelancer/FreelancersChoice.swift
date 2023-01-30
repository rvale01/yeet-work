//
//  FreelancersChoice.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 29/01/2023.
//

import SwiftUI

struct FreelancersChoice: View {
    @State private var data: [FreelancerDetails]?
    @State private var isLoading = true
    @State private var index: Int = 0
    @State var onChoice: (FreelancerDetails) -> Void
    @State var onBack: () -> Void
    
    var body: some View {
            VStack(alignment: .center) {
                if(isLoading){
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }else{
                    Text("Results")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                        .multilineTextAlignment(.center)
                    
                        ZStack {
                            Rectangle()
                                .stroke(lineWidth: 0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.8509803921568627, blue: 0.7607843137254902)/*@END_MENU_TOKEN@*/)
                                .cornerRadius(20)
                            
                            
                            VStack {
                                AsyncImage(url: data?[index].image)
                                .frame(width: 150, height: 150)
                                .cornerRadius(100)
                                .padding(.bottom, 5.0)
                                
                                Text(data?[index].username ?? "username").font(.title).bold()
                                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                                
                                Text(data?[index].title ?? "Title")
                                    .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                                HStack{
                                    ForEach(0 ..< (data?[index].average_stars ?? 0), id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                    }
                                     
                                    Text(String(data?[index].reviews_no ?? 0) + " reviews")
                                }.padding(.bottom, 10.0)
                                
                                Text(data?[index].long_desc ?? "")
                                    .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                                
                            }
                            .padding()
                        }
                        .padding()
                    }
                
                    Button(action: onBack){
                    Text("Back")
                            .fontWeight(.bold)
                            .padding(.bottom, 10.0)
                            .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                    }
                    
                    HStack(spacing: 100) {
                        Button(action: {
                            onChoice(data![index])
                        }) {
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(#colorLiteral(red: 0.9568627451, green: 0.5764705882, blue: 0.3529411765, alpha: 1)))
                                .clipShape(Circle())
                        }
                        
                        Button(action: {
                            if(index == ((data?.count ?? 1) - 1)){
                                index = 0
                            }else {
                                index = index + 1
                            }
                        }) {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .foregroundColor(Color(#colorLiteral(red: 0.9568627451, green: 0.5764705882, blue: 0.3529411765, alpha: 1)))
                        }
                    }.padding(.bottom, 10.0)
            }
            .onAppear {
                print("Ok")
                getFreelancers(completion: {apiReturn in
                    data = (apiReturn as! [FreelancerDetails])
                    isLoading = false
                })
            }
        }
}

struct FreelancersChoice_Previews: PreviewProvider {
    static var previews: some View {
        FreelancersChoice(onChoice: {freelancer in print("okok")}, onBack: {print("back")})
    }
}
