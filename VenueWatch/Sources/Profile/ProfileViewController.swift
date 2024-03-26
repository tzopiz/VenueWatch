//
//  ProfileViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

final class ProfileViewController: BaseViewController<ProfileViewModel> {
    
    // MARK: - Configure
    override func configureViews() {
        super.configureViews()
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
        let loginViewModel = LoginViewModel(currentLoginType: .signUp)
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
