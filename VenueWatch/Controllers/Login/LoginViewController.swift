//
//  LoginViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit
import AuthenticationServices

final class LoginViewController: BaseViewController {
    private lazy var signInButton = ASAuthorizationAppleIDButton(
        authorizationButtonType: .signIn,
        authorizationButtonStyle: .black
    )
    private let service = AppleLoginService()
}

// MARK: - Configure
extension LoginViewController {
    override func setupViews() {
        super.setupViews()
        view.addSubview(signInButton)
    }
    override func layoutViews() {
        super.layoutViews()
        signInButton.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview().inset(32)
            make.height.equalTo(64)
        }
    }
    override func configureViews() {
        super.configureViews()
        signInButton.addTarget(self, action: #selector(onSignInTapped), for: .touchUpInside)
        signInButton.isEnabled = false
        signInButton.alpha = 0.7
    }
}

// MARK: - Actions
extension LoginViewController {
    @IBAction private func onSignInTapped() {
        service.login { result in
            switch result {
            case .success(let result):
                print(result.fullName)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
