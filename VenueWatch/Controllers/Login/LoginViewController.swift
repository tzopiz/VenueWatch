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
    private lazy var signUpButton = ASAuthorizationAppleIDButton(
        authorizationButtonType: .signUp,
        authorizationButtonStyle: .black
    )
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    private let service = AppleLoginService()
}

// MARK: - Configure
extension LoginViewController {
    override func setupViews() {
        super.setupViews()
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(signUpButton)
    }
    override func layoutViews() {
        super.layoutViews()
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.bottom.equalToSuperview().inset(64)
            make.height.equalTo(132)
        }
    }
    override func configureViews() {
        super.configureViews()
        signInButton.addTarget(self, action: #selector(onSignInTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(onSignUpTapped), for: .touchUpInside)
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
    @IBAction private func onSignUpTapped() {
        print(#function)
    }
}
