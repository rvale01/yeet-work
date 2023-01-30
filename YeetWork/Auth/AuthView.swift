//
//  View.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 11/01/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct ChooseAuthView: View {
    var onChangeView: (Int) -> Void;
    
    var body: some View {
        ZStack{
            Color.init(UIColor(red:255.0/255.0, green:217.0/255.0, blue:194.0/255.0, alpha: 1)
            )
            VStack{
                Text("Find the best freelancer now!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 90.0)
                    .padding(.top, 150.0)
                        
                        Button(action: {onChangeView(1)}){
                            Text("Login")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(.vertical, 20.0)
                                .padding(.horizontal, 100.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9647058823529412, green: 0.5764705882352941, blue: 0.34901960784313724)/*@END_MENU_TOKEN@*/)
                                .cornerRadius(30)
                                .padding(.bottom, 10.0)
                        }


                        Button(action: {onChangeView(2)}){
                            Text("Register")
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                            .padding(.vertical, 20.0)
                            .padding(.horizontal, 90.0)
                            .background()
                            .cornerRadius(30)
                            .padding(.bottom, 25.0)
                        }
                        
                        Button(action: {onChangeView(2)}){
                            Text("Go back")
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                            
                        }
            }
        }
        .ignoresSafeArea()
    }

}

struct SwitchAuthView: View {
    @State private var page: Int = 0;
    
    func onChangeView(page_: Int) {
        page = page_
    }
    var body: some View {
        VStack{
            switch(page){
            case 1:LoginView(onBack: {onChangeView(page_: 0)});
                case 2:RegistrationView(onBack: {onChangeView(page_: 0)});
            default: ChooseAuthView(onChangeView:onChangeView);
            }
        }
    }
}

struct Auth_View_Previews: PreviewProvider {
    static var previews: some View {
        SwitchAuthView()
    }
}
