//
//  User.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

struct User: Codable {
    let gender: Gender
    let name: Name
    let location: Location
    let email: String
    let phone: String
    let picture: Picture
}

extension User {
    enum Gender: String, Codable {
        case male
        case female
    }
    
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
    }
    
    struct Location: Codable {
        let street: Street
        let city: String
        let state: String
        let country: String
        let postcode: Int
        
        struct Street: Codable {
            let number: Int
            let name: String
        }
    }
    
    struct Picture: Codable {
        let large: URL
        let medium: URL
        let thumbnail: URL
    }
}
