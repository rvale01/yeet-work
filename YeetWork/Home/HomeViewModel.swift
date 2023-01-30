//
//  HomeViewModel.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 26/01/2023.
//

import Foundation

func getInitData(completion: @escaping (Any) -> ()) {
        URLSession.shared.dataTask(with: URL(string: "https://mob-app-be.vercel.app/home-page-data")!) {
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
                    let decodedData = try JSONDecoder().decode(HomeInitData.self, from: data)
                    completion(decodedData)
                } catch {
                    completion("error")
                }
        }.resume()
}
