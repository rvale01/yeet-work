//
//  RegistrationView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 21/01/2023.
//

import SwiftUI

// Inputs which are used by the user to register 
struct RegistrationView: View {
    var onBack: () -> Void;
    
    @EnvironmentObject private var userViewModel: UserViewModel
    
    @State private var showAlert = false
    @State private var errMsg = ""
    @State private var email: String = ""
    @State private var pass: String = ""
    @State private var pass2: String = ""
    @State private var fullName: String = ""
    
    func onRegisterClick (){
        userViewModel.register(email: email, pass: pass, pass2: pass2, fullName: fullName) { res in
            if(res != "success"){
                errMsg = res
                showAlert = true
            }
        }
    }
    
    var body: some View {
        
        Spacer()
        Text("Register")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
        TextField("Full Name", text: $fullName)
            .textContentType(.emailAddress)
            .padding(10.0)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.6196078431372549, green: 0.6196078431372549, blue: 0.6196078431372549), lineWidth: 2)
                
            )
            .padding(.horizontal, 30.0)
            .padding(.vertical, 10.0)
        
        
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
        
        
        SecureField("Password", text: $pass)
            .textContentType(.password)
            .padding(10.0)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.6196078431372549, green: 0.6196078431372549, blue: 0.6196078431372549), lineWidth: 2)
                
            )
            .padding(.horizontal, 30.0)
            .padding(.vertical, 10.0)
        
        SecureField("Repeat Password", text: $pass2)
            .textContentType(.emailAddress)
            .padding(10.0)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.6196078431372549, green: 0.6196078431372549, blue: 0.6196078431372549), lineWidth: 2)
                
            )
            .padding(.horizontal, 30.0)
            .padding(.vertical, 10.0)
        
        Button(action:onRegisterClick){
                Text("Register")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.vertical, 20.0)
                .padding(.horizontal, 100.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9647058823529412, green: 0.5764705882352941, blue: 0.34901960784313724)/*@END_MENU_TOKEN@*/)
                .cornerRadius(30)
            }
        .alert(isPresented: $showAlert) {
                Alert(
                title: Text("Ops! Something went wrong!"),
                        message: Text(errMsg)
                    )
                }
    
        Button(action: {onBack()}){
            Text("Go back")
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
            
        }
        Spacer()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(onBack: {print("Hi")})
    }
}
