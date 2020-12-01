//
//  UserDetailRouter.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import UIKit

final class UserDetailRouter: RouterInterface {
    weak var presenter: UserDetailPresenterRouterInterface?
    weak var viewController: UIViewController?
}

extension UserDetailRouter: UserDetailRouterPresenterInterface {

}
