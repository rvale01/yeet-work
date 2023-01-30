//
//  Model.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 11/01/2023.
//

import Foundation
import Firebase
import FirebaseAuth

final class UserViewModel: ObservableObject {
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func login(email: String, pass: String, completion: @escaping (String) -> ()) {
        var res = ""
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if error != nil {
                if(error != nil && error?.localizedDescription != nil)
                {
                    res = error?.localizedDescription ?? "There was an error! Please try again!"
                }else {
                    res = "There was an error! Please try again!"
                }
            } else {
                res = "success"
            }
            completion(res)
        }
        
    }
    
    func onAuthUpdate() {
        Auth.auth().addStateDidChangeListener { auth, user_ in
            self.user = user_
            return
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let err {
            let _ = print(err)
        }
    }
    
    func register(email: String, pass: String, pass2: String ,fullName: String, completion: @escaping (String) -> ()){
        if(pass != pass2){
            completion("The passwords are different!")
        }
        var res = ""
        
        Auth.auth().createUser(withEmail: email, password: pass)
        {(result, error) in
            if error != nil {
                res = error?.localizedDescription ?? "There was an error! Please try again!"
                completion(res)
            } else {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = fullName
                changeRequest?.commitChanges { error in
                    if error != nil {
                        res = error?.localizedDescription ?? "There was an error! Please try again!"
                    } else {
                        res = "success"
                    }
                    completion(res)
                }
            }
        }
    }
}
