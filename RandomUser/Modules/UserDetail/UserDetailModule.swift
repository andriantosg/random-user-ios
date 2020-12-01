//
//  UserDetailModule.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import UIKit

final class UserDetailModule: ModuleInterface {
    typealias View = UserDetailView
    typealias Presenter = UserDetailPresenter
    typealias Router = UserDetailRouter
    typealias Interactor = UserDetailInteractor

    func build(user: User) -> UIViewController {
        let view = View()
        let interactor = Interactor(user: user)
        let router = Router()
        let presenter = Presenter(interactor: interactor, router: router)
        
        assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
