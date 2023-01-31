//
//  SwitchSearch.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 28/01/2023.
//

import SwiftUI

// This view contains a switch between the diffferent pages of the search features
// For each view is passed a function which will show the next page
// Except for the first view, to the other views it is being passed also a function which will show the previous page
struct SwitchSearch: View {
    @State var page: Int = 0
    @State var selected_category: String = ""
    @State var selected_country: String = ""
    @State var choosen_freelancer: FreelancerDetails?
    
    var body: some View {
        switch(page){
            case 0: CategoriesView { category in
                selected_category = category
                page = 1
            }
            case 1: LocationsView(onNext:{ location in
                selected_country = location
                page = 2
            },onBack: {page = 0})
            case 2: FreelancersChoice(onChoice: {
                freelancer in
                choosen_freelancer = freelancer
                page = 4
            }, onBack: {page = 1})
        default: FreelancerDetailsView(freelancer: choosen_freelancer, onBack: {
            page = 2
        })
        }
    }
}

struct SwitchSearch_Previews: PreviewProvider {
    static var previews: some View {
        SwitchSearch()
    }
}
