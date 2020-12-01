//
//  UserListTableViewCell.swift
//  RandomUser
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import UIKit
import Kingfisher

class UserListTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.layer.cornerRadius = 24.0
    }
    
    func configure(user: User) {
        avatarImageView.kf.setImage(with: user.picture.thumbnail)
        nameLabel.text = "\(user.name.title). \(user.name.first) \(user.name.last)"
        emailLabel.text = user.email
    }
}
