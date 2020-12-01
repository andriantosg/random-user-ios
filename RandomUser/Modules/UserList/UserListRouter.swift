//
//  UserListRouter.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import UIKit

final class UserListRouter: RouterInterface {
    weak var presenter: UserListPresenterRouterInterface?
    weak var viewController: UIViewController?
}

extension UserListRouter: UserListRouterPresenterInterface {
    func showUserDetail(user: User) {
        viewController?.navigationController?.pushViewController(UserDetailModule().build(user: user), animated: true)
    }
}
