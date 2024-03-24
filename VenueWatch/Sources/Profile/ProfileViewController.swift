//
//  ProfileViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

final class ProfileViewController: BaseViewController { }

// MARK: - Configure
extension ProfileViewController {
    override func setupViews() {
        super.setupViews()
    }
    override func layoutViews() {
        super.layoutViews()
    }
    override func configureViews() {
        super.configureViews()
        navigationItem.title = App.string.profile()
        addNavBarButton(
            at: .right,
            with: App.string.logIn(),
            selector: #selector(loginButtonTapped)
        )
    }
}

// MARK: - Actions

extension ProfileViewController {
    @IBAction private func loginButtonTapped() {
        let loginViewController = LoginViewController(currentLoginType: .signUp)
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
