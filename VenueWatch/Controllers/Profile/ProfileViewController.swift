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
            with: App.string.signIn(),
            selector: #selector(sigInButtonTapped)
        )
        addNavBarButton(
            at: .right,
            with: App.string.signUp(),
            selector: #selector(signUpButtonTapped)
        )
    }
}

// MARK: - Actions

extension ProfileViewController {
    @IBAction private func sigInButtonTapped() {
        let viewController = LoginViewController(currentLoginType: .signIn)
        UIApplication.shared.keyWindow!.switchRootViewController(viewController, animated: true)
    }
    @IBAction private func signUpButtonTapped() {
        let viewController = LoginViewController(currentLoginType: .signUp)
        UIApplication.shared.keyWindow!.switchRootViewController(viewController, animated: true)
    }
}
