//
//  UserListModule.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import UIKit

final class UserListModule: ModuleInterface {
    typealias View = UserListView
    typealias Presenter = UserListPresenter
    typealias Router = UserListRouter
    typealias Interactor = UserListInteractor

    func build() -> UIViewController {
        let view = View()
        let interactor = Interactor()
        let router = Router()
        let presenter = Presenter(interactor: interactor, router: router)
        
        assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
