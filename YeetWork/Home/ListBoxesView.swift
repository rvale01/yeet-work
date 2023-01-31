//
//  HighestRatingsView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 26/01/2023.
//

import SwiftUI

// A scroll view which loops trough all the freelancers and shows
// each of them in a box (BoxView). The box is clickable, so when clicking on the box
// the onFreelancerClick is called.

struct ListBoxesView: View {
    @State var title: String
    @State var freelancers: [FreelancerDetails]?
    @State var onFreelancerClick: (FreelancerDetails) -> Void

    var body: some View{
        VStack(alignment: .leading){
            Text(title)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(freelancers ?? [], id: \.self.username){ freelancer in
                        Button(action: {onFreelancerClick(freelancer)}){
                            BoxView(
                                title: "@"+freelancer.username,
                                subtitle1: String(freelancer.average_stars) + " stars (" + String(freelancer.reviews_no) + ")",
                                subtitle2: freelancer.title
                            )
                            .padding([.top, .leading, .bottom], 10.0)
                        }
                    }
                    
                }
            }
        }
    }
}

struct HighestRatingsView_Previews: PreviewProvider {
    static var previews: some View {
        ListBoxesView(title: "View", onFreelancerClick: {freelancer in print("Ok")})
    }
}
