//
//  UserDetailContracts.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

// MARK: - Router
protocol UserDetailRouterPresenterInterface: RouterPresenterInterface {

}

// MARK: - Presenter
protocol UserDetailPresenterRouterInterface: PresenterRouterInterface {

}

protocol UserDetailPresenterInteractorInterface: PresenterInteractorInterface {
    func onDataFetched(user: User)
}

protocol UserDetailPresenterViewInterface: PresenterViewInterface {
    func onViewDidLoad()
}

// MARK: - Interactor
protocol UserDetailInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchData()
}

// MARK: - View
protocol UserDetailViewPresenterInterface: ViewPresenterInterface {
    func showData(user: User)
}
