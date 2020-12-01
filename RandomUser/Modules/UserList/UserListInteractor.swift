//
//  UserListInteractor.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

final class UserListInteractor: InteractorInterface {
    weak var presenter: UserListPresenterInteractorInterface?
}

extension UserListInteractor: UserListInteractorPresenterInterface {
    func fetchData() {
        let dataManager: UserApiDataManager = UserApiDataManager()
        dataManager.getUsers { result in
            switch result {
            case .success(let data):
                self.presenter?.onDataFetched(users: data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
