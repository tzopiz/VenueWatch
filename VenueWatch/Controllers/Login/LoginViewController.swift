//
//  LoginViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

final class LoginViewController: BaseViewController {
    private let appleButtonsView = AppleButtonsView()
    private let appleLoginService = AppleLoginService()
    
    private let mainStackView = BaseStackView(axis: .vertical, spacing: 32)
    private let authHeaderView = AuthHeaderView()
    private let credentialInputView = CredentialInputView()
    private let authButton = UIButton(type: .system)
}

// MARK: - Configure
extension LoginViewController {
    override func setupViews() {
        super.setupViews()
        addSubviews(mainStackView)
        
        mainStackView.addArrangedSubviews(
            authHeaderView, credentialInputView,
            authButton, appleButtonsView
        )
    }
    override func layoutViews() {
        super.layoutViews()
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(32)
            make.centerX.equalToSuperview()
        }
        authButton.snp.makeConstraints { $0.height.equalTo(60) }
        credentialInputView.snp.makeConstraints { $0.height.equalTo(182) }
    }
    override func configureViews() {
        super.configureViews()
        appleButtonsView.addSelectors(
            signInSelector: #selector(onSignInAppleButtonTapped),
            signUpSelector: #selector(onSignUpAppleButtonTapped)
        )
        
        authButton.backgroundColor = App.color.accentColor
        authButton.titleLabel?.font = App.font.rubikBold(size: 20)
        authButton.tintColor = .white
        authButton.layer.cornerRadius = 10
        authButton.layer.borderWidth = 1
        authButton.layer.borderColor = App.color.accentColor.cgColor
        authButton.setTitle(App.string.signUp(), for: .normal)
        
        authButton.addTarget(self, action: #selector(authButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension LoginViewController {
    @IBAction private func onSignInAppleButtonTapped() {
        appleLoginService.login { result in
            switch result {
            case .success(let result):
                print(result.fullName)
            case .failure(let error):
                Utilities.Alert.showFetchingUserError(on: self, with: error)
            }
        }
    }
    @IBAction private func onSignUpAppleButtonTapped() {
        print(#function)
    }
    @IBAction private func authButtonTapped() {
        
    }
}
