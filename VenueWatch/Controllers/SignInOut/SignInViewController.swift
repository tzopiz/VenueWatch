//
//  SignInViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit
import AuthenticationServices

final class SignInViewController: BaseViewController {
    private lazy var button = ASAuthorizationAppleIDButton(
        authorizationButtonType: .signIn,
        authorizationButtonStyle: .black
    )
    private let service = AppleLoginService()
}

// MARK: - Configure

extension SignInViewController {
    override func setupViews() {
        super.setupViews()
        view.addSubview(button)
    }
    override func layoutViews() {
        super.layoutViews()
        button.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(64)
            make.height.equalTo(64)
        }
    }
    override func configureViews() {
        super.configureViews()
        button.addTarget(self, action: #selector(onAuthTapped), for: .touchUpInside)
    }
    @IBAction private func onAuthTapped() {
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

