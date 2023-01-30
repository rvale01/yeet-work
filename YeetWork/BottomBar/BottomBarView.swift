//
//  BottomBarView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 24/01/2023.
//

import SwiftUI

struct BottomBar: View {
    @State private var selectedTab = 0
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(#colorLiteral(red: 0.9568627451, green: 0.5764705882, blue: 0.3529411765, alpha: 1)))
        UITabBar.appearance().unselectedItemTintColor = .white
        }
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
             .tabItem {
                Image(systemName: "house.fill")
                 if selectedTab == 0 {
                     Text("Home")
                 }
             }.tag(0)

            SwitchSearch()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    if selectedTab == 1 {
                        Text("Search")
                    }
                }.tag(1)
            
           AccountView()
             .tabItem {
                Image(systemName: "person.fill")
                 if selectedTab == 2 {
                     Text("Account")
                }
            }.tag(2)
        }
        .accentColor(.white)
    }
}


struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
