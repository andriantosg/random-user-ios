//
//  ViperContracts.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import Foundation

// MARK: - Interfaces

protocol RouterPresenterInterface: class {}

protocol PresenterRouterInterface: class {}

protocol InteractorPresenterInterface: class {}

protocol PresenterInteractorInterface: class {}

protocol ViewPresenterInterface: class {}

protocol PresenterViewInterface: class {}

// MARK: - VIPER

protocol RouterInterface: RouterPresenterInterface {
    associatedtype PresenterRouter

    var presenter: PresenterRouter { get set }
}

protocol InteractorInterface: InteractorPresenterInterface {
    associatedtype PresenterInteractor

    var presenter: PresenterInteractor { get set }
}

protocol PresenterInterface: PresenterRouterInterface & PresenterInteractorInterface & PresenterViewInterface {
    associatedtype RouterPresenter
    associatedtype InteractorPresenter
    associatedtype ViewPresenter

    var router: RouterPresenter { get set }
    var interactor: InteractorPresenter { get set }
    var view: ViewPresenter { get set }
}

protocol ViewInterface: ViewPresenterInterface {
    associatedtype PresenterView

    var presenter: PresenterView { get set }
}

protocol EntityInterface { }

// MARK: - Module

protocol ModuleInterface {
    associatedtype View where View: ViewInterface
    associatedtype Presenter where Presenter: PresenterInterface
    associatedtype Router where Router: RouterInterface
    associatedtype Interactor where Interactor: InteractorInterface

    func assemble(view: View, presenter: Presenter, router: Router, interactor: Interactor)
}

extension ModuleInterface {

    func assemble(view: View, presenter: Presenter, router: Router, interactor: Interactor) {
        guard let presenterView = presenter as? Self.View.PresenterView,
              let viewPresenter = view as? Self.Presenter.ViewPresenter,
              let presenterInteractor = presenter as? Self.Interactor.PresenterInteractor,
              let interactorPresenter = interactor as? Self.Presenter.InteractorPresenter,
              let presenterRouter = presenter as? Self.Router.PresenterRouter,
              let routerPresenter = router as? Self.Presenter.RouterPresenter
        else {
            // If some protocol is missing the app will crash.
            fatalError("Failed to assemble module.")
        }
        
        view.presenter = presenterView
        interactor.presenter = presenterInteractor
        router.presenter = presenterRouter
        
        presenter.view = viewPresenter
        presenter.interactor = interactorPresenter
        presenter.router = routerPresenter
    }
}
