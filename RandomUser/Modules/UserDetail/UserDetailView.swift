//
//  UserDetailView.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import UIKit

class UserDetailView: UIViewController, ViewInterface {
    var presenter: UserDetailPresenterViewInterface?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
}

extension UserDetailView: UserDetailViewPresenterInterface {
    func showData(user: User) {
        // Show User detail here
        title = user.name.first
    }
}
