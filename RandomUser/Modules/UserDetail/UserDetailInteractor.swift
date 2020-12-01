//
//  UserDetailInteractor.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

final class UserDetailInteractor: InteractorInterface {
    weak var presenter: UserDetailPresenterInteractorInterface?
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
}

extension UserDetailInteractor: UserDetailInteractorPresenterInterface {
    func fetchData() {
        presenter?.onDataFetched(user: user)
    }
}
