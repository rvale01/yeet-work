//
//  PopularView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 26/01/2023.
//

import SwiftUI

// A scroll view which loops trough all the freelancers
// (popularFreelancers) and for each of them it shows an image (based on the url). When clicking on the image, the onClickFreelancer will be called.
struct PopularView: View {
    @State var popularFreelancers: [FreelancerDetails]?;
    @State var onClickFreelancer: (FreelancerDetails) -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Most popular of the week")
                .multilineTextAlignment(.leading)
                .padding(4.0)
                .padding(.leading)
                .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(popularFreelancers ?? [], id: \.self.username){freelancer in
                        ProfileView(onClick: {onClickFreelancer(freelancer)}, url: freelancer.image)
                    }
                    .padding([.top, .leading, .bottom], 10.0)
                }
                
            }
        }
        
    }
}

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView(popularFreelancers: [], onClickFreelancer: {freelancer in print("freelancer")})
    }
}
