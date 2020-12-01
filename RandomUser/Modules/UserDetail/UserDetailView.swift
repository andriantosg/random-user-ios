//
//  UserDetailView.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import UIKit
import Kingfisher

class UserDetailView: UIViewController, ViewInterface {
    var presenter: UserDetailPresenterViewInterface?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.onViewDidLoad()
    }
    
    private func setupView() {
        title = "Random User Detail"
        avatarImageView.layer.cornerRadius = 60.0
    }
}

extension UserDetailView: UserDetailViewPresenterInterface {
    func showData(user: User) {
        avatarImageView.kf.setImage(with: user.picture.medium)
        nameLabel.text = "\(user.name.title). \(user.name.first) \(user.name.last)"
        emailLabel.text = user.email
        phoneLabel.text = user.phone
    }
}
