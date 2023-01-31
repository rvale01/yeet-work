//
//  FreelancersChoiceModelView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 29/01/2023.
//

import Foundation

// This function will get all the freelancers in the api, decode them and return them on completion
func getFreelancers(completion: @escaping (Any) -> ()) {
        URLSession.shared.dataTask(with: URL(string: "https://mob-app-be.vercel.app/all-users")!) {
            (data, _, error) in
                if error != nil {
                    completion("error")
                    return
                }
                
                guard let data = data else {
                    completion("error")
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode([FreelancerDetails].self, from: data)
                    completion(decodedData)
                } catch {
                    completion("error")
                }
        }.resume()
}
