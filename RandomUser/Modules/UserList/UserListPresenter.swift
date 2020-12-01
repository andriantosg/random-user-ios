//
//  UserListPresenter.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

final class UserListPresenter: PresenterInterface {
    var router: UserListRouterPresenterInterface
    var interactor: UserListInteractorPresenterInterface
    weak var view: UserListViewPresenterInterface?
    
    init(interactor: UserListInteractorPresenterInterface, router: UserListRouterPresenterInterface) {
        self.interactor = interactor
        self.router = router
    }
}

extension UserListPresenter: UserListPresenterRouterInterface {}

extension UserListPresenter: UserListPresenterInteractorInterface {
    func onDataFetched(users: [User]) {
        view?.showData(users: users)
    }
}

extension UserListPresenter: UserListPresenterViewInterface {
    func onUserSelected(user: User) {
        router.showUserDetail(user: user)
    }
    
    func onViewDidLoad() {
        interactor.fetchData()
    }
}
