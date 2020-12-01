//
//  UserListInteractor.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

final class UserListInteractor: InteractorInterface {
    weak var presenter: UserListPresenterInteractorInterface?
    
    let userApiDataManager: UserApiDataManagerProtocol
    let userLocalDataManager: UserLocalDataManagerProtocol
    
    init(userApiDataManager: UserApiDataManagerProtocol = UserApiDataManager(), userLocalDataManager: UserLocalDataManagerProtocol = UserLocalDataManager()) {
        self.userApiDataManager = userApiDataManager
        self.userLocalDataManager = userLocalDataManager
    }
}

extension UserListInteractor: UserListInteractorPresenterInterface {
    func saveDataToLocal(users: [User]) {
        userLocalDataManager.saveUsers(users: users)
    }
    
    func fetchData() {
        userApiDataManager.getUsers { result in
            switch result {
            case .success(let data):
                self.presenter?.onDataFetched(users: data)
            case .failure(let error):
                self.presenter?.onDataFetchedError(error: error)
            }
        }
    }
    
    func fetchDataFromLocal() {
        userLocalDataManager.getUsers { result in
            switch result {
            case .success(let data):
                self.presenter?.onDataFetched(users: data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
