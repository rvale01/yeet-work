//
//  HomeModel.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 27/01/2023.
//

import Foundation

struct Review: Decodable {
    let image: URL
    let username: String
    let stars: Int
    let review: String
}

struct FreelancerDetails: Decodable {
    let image: URL
    let username: String
    let title: String
    let reviews_no: Int
    let average_stars: Int
    let short_desc: String
    let long_desc: String
    let lates_reviews: [Review]
}

struct HomeInitData: Decodable {
    let most_popular: [FreelancerDetails]
    let verified_users: [FreelancerDetails]
    let highest_ratings: [FreelancerDetails]
}
