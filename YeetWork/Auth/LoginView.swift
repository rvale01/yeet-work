//
//  LoginView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 21/01/2023.
//

import SwiftUI

// View used by the user to login
struct LoginView: View {
    var onBack: () -> Void;
    
    @EnvironmentObject private var userViewModel: UserViewModel
    
    @State private var showAlert = false
    @State private var errMsg = ""
    @State private var email: String = ""
    @State private var pass: String = ""
    
    func onLoginClick (){
        userViewModel.login(email: email, pass: pass) { res in
            if(res != "success"){
                errMsg = res
                showAlert = true
            }
        }
    }
    
    var body: some View {
        Spacer()
        Text("Login")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
        TextField("Email", text: $email)
            .textContentType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(10.0)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.6196078431372549, green: 0.6196078431372549, blue: 0.6196078431372549), lineWidth: 2)
                        
                )
            .padding(.horizontal, 30.0)
            .padding(.vertical, 10.0)
        
        SecureField("Password", text: $pass).textContentType(.password)
            .padding(10.0)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.6196078431372549, green: 0.6196078431372549, blue: 0.6196078431372549), lineWidth: 2)
                        
                )
            .padding(.horizontal, 30.0)
            .padding(.vertical, 10.0)
            .padding(.bottom, 50.0)
        
        Button(action:onLoginClick){
                Text("Login")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.vertical, 20.0)
                .padding(.horizontal, 100.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9647058823529412, green: 0.5764705882352941, blue: 0.34901960784313724)/*@END_MENU_TOKEN@*/)
                .cornerRadius(30)
            }
        
        Button(action: {onBack()}){
            Text("Go back")
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
            
        }
        .alert(isPresented: $showAlert) {
                Alert(
                title: Text("Ops! Something went wrong!"),
                        message: Text(errMsg)
                    )
                }
        Spacer()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(onBack: {print("Hi")})
    }
}
