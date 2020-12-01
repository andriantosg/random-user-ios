//
//  UserLocalDataManager.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

protocol UserLocalDataManagerProtocol {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
    func saveUsers(users: [User])
}

struct UserLocalDataManager: UserLocalDataManagerProtocol {
    
    let key: String = "users"
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let defaults = UserDefaults.standard
        do {
            let data = try defaults.getObject(forKey: key, castTo: [User].self)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    
    func saveUsers(users: [User]) {
        let defaults = UserDefaults.standard
        do {
            try defaults.setObject(users, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
}
