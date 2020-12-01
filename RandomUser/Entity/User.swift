//
//  User.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

struct User: Codable {
    let name: Name
    let email: String
    let phone: String
    let picture: Picture
}

extension User {
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
    }
    struct Picture: Codable {
        let large: URL
        let medium: URL
        let thumbnail: URL
    }
}
