//
//  SwitchSearch.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 28/01/2023.
//

import SwiftUI

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
            case 1: LocationsView{ location in
                selected_country = location
                page = 2
            }
            case 2: FreelancersChoice{
                freelancer in
                choosen_freelancer = freelancer
                page = 4
            }
            default: FreelancerDetailsView(freelancer: choosen_freelancer)
        }
    }
}

struct SwitchSearch_Previews: PreviewProvider {
    static var previews: some View {
        SwitchSearch()
    }
}
