//
//  UserApiDataManager.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation
import Alamofire

protocol UserApiDataManagerProtocol {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
}

struct UserApiDataManager: UserApiDataManagerProtocol {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let parameters: Parameters = [
            "results": 100,
            "seed": "example",
            "nat": "au"
        ]
        AF.request("https://randomuser.me/api", parameters: parameters)
            .responseDecodable(of: RandomUserResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

extension UserApiDataManager {
    struct RandomUserResponse: Codable {
        let results: [User]
    }
}
