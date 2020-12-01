//
//  UserListContracts.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

// MARK: - Router
protocol UserListRouterPresenterInterface: RouterPresenterInterface {
    func showUserDetail(user: User)
}

// MARK: - Presenter
protocol UserListPresenterRouterInterface: PresenterRouterInterface {

}

protocol UserListPresenterInteractorInterface: PresenterInteractorInterface {
    func onDataFetched(users: [User])
}

protocol UserListPresenterViewInterface: PresenterViewInterface {
    func onViewDidLoad()
    func onUserSelected(user: User)
}

// MARK: - Interactor
protocol UserListInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchData()
}

// MARK: - View
protocol UserListViewPresenterInterface: ViewPresenterInterface {
    func showData(users: [User])
}
