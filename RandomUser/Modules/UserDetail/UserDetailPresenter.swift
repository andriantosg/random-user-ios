//
//  UserDetailPresenter.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

final class UserDetailPresenter: PresenterInterface {
    var router: UserDetailRouterPresenterInterface
    var interactor: UserDetailInteractorPresenterInterface
    weak var view: UserDetailViewPresenterInterface?
    
    init(interactor: UserDetailInteractorPresenterInterface, router: UserDetailRouterPresenterInterface) {
        self.interactor = interactor
        self.router = router
    }
}

extension UserDetailPresenter: UserDetailPresenterRouterInterface {}

extension UserDetailPresenter: UserDetailPresenterInteractorInterface {
    func onDataFetched(user: User) {
        view?.showData(user: user)
    }
}

extension UserDetailPresenter: UserDetailPresenterViewInterface {
    func onViewDidLoad() {
        interactor.fetchData()
    }
}
