//
//  UserListInteractor.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

final class UserListInteractor: InteractorInterface {
    weak var presenter: UserListPresenterInteractorInterface?
    
    let userApiDataManager: UserApiDataManager = UserApiDataManager()
    let userLocalDataManager: UserLocalDataManager = UserLocalDataManager()
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
