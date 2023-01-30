//
//  YeetWorkApp.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 24/11/2022.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

struct SwitchView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        Group {
            if userViewModel.user == nil {
                IntroductionView()
                    .onAppear {
                        userViewModel.onAuthUpdate()
                    }
            } else {
                BottomBar()
            }
        }
    }

}

@main
struct YeetWorkApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SwitchView().environmentObject(UserViewModel())
        }
    }
}

