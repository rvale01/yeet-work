//
//  FreelancerDetails.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 29/01/2023.
//

import SwiftUI

struct FreelancerDetailsView: View {
    @State private var offset = CGFloat(0)
    @State var freelancer: FreelancerDetails?
      
      var body: some View {
        GeometryReader { geometry in
          ZStack{
              VStack{
                  AsyncImage(url: freelancer?.image)
                      .frame(width: 150, height: 150)
                      .cornerRadius(100)
                      .padding(5.0)
                      .alignmentGuide(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Guide@*/.top/*@END_MENU_TOKEN@*/) { dimension in
                          /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/dimension[.top]/*@END_MENU_TOKEN@*/
                      }
                      
                  
                  Text(freelancer?.username ?? "username").font(.title).bold()
                      .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                  
                  Text(freelancer?.title ?? "Title")
                      .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                  HStack{
                      ForEach(0 ..< (freelancer?.average_stars ?? 1), id: \.self) { _ in
                          Image(systemName: "star.fill")
                      }
                      
                      Text(String(freelancer?.reviews_no ?? 0) + " reviews")
                  }.padding(.bottom, 100.0)
                  
                  Button(action: {
                      if let url = URL(string: "https://www.fiverr.com/"+(freelancer?.username ?? "")) {
                      UIApplication.shared.open(url)
                    }
                  }){
                      Text("Contact freelancer")
                      .fontWeight(.bold)
                      .foregroundColor(Color.white)
                      .padding(.vertical, 20.0)
                      .padding(.horizontal, 100.0)
                      .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9647058823529412, green: 0.5764705882352941, blue: 0.34901960784313724)/*@END_MENU_TOKEN@*/)
                      .cornerRadius(30)
                  }
                  Spacer()
              }
              .padding()
              
              
              VStack {
                  Text("About me")
                      .font(.title)
                      .bold()
                      .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                  
                  Text(freelancer?.long_desc ?? "")
                      .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))

                              VStack(alignment: .leading) {
                                  HStack {
                                      AsyncImage(url: freelancer?.lates_reviews[0].image)
                                          .frame(width: 50, height: 50)
                                          .cornerRadius(20)

                                      VStack(alignment: .leading) {
                                          Text(freelancer!.lates_reviews[0].username)
                                              .fontWeight(.bold)
                                          HStack{
                                              ForEach(0 ..< (freelancer!.lates_reviews[0].stars)) { _ in
                                                  Image(systemName: "star.fill")
                                              }
                                          }
                                          Text(freelancer!.lates_reviews[0].review)
                                      }
                                  }
                                  .padding()
                                  .background(Color.white)
                                  .cornerRadius(20)
                              }
                  Spacer()

              }
              .padding()
              .frame(width: geometry.size.width, height: geometry.size.height)
              .background(Color(red: 1.0, green: 0.8509803921568627, blue: 0.7607843137254902))
              .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
              .offset(y: offset)
              .gesture(
                DragGesture()
                    .onChanged { value in
                            offset = value.translation.height
                    }
                  .onEnded { value in
                    if offset > 100 {
                      withAnimation {
                        offset = (geometry.size.height - 90)
                      }
                    } else {
                      withAnimation {
                        offset = 90
                      }
                    }
                  }
              )
              
            }
          .onAppear(){
                offset = geometry.size.height - 100
            }
        }
      }
}

struct FreelancerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FreelancerDetailsView()
    }
}
