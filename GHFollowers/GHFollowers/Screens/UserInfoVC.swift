//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Andres Rivillas on 6/09/24.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var username: String!
    let avatarImageView = GFAvatarImageView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        
        navigationItem.title = username
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkManager.shared.getUserInfo(for: username) { result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
}
