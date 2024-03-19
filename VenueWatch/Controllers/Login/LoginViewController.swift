//
//  LoginViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit
import AuthenticationServices

final class LoginViewController: BaseViewController {
    enum LoginType {
        case signIn
        case signUp
    }
    private var currentLoginType: LoginType = .signUp
    private let appleButtonsView = AppleButtonsView()
    private let appleLoginService = AppleLoginService()
    
    private let mainStackView = BaseStackView(axis: .vertical, spacing: 16)
    private let authHeaderView = AuthHeaderView()
    private let credentialInputView = CredentialInputView()
    private let buttonsStackView = BaseStackView(axis: .vertical)
    
    private let toggleButton = ToggleButton(
        titles: (App.string.toggleButtonTitleSignIn(), App.string.toggleButtonTitleSignUp())
    )
    private let authButton = ToggleButton(
        titles: (App.string.signIn(), App.string.signUp())
    )
    private let secondaryButton = ToggleButton(
        titles: (App.string.secondaryButtonTitleSignIn(), App.string.secondaryButtonTitleSignUp())
    )
}

// MARK: - Configure
extension LoginViewController {
    override func setupViews() {
        super.setupViews()
        addSubviews(mainStackView)
        
        mainStackView.addArrangedSubviews(
            authHeaderView, credentialInputView,
            buttonsStackView, appleButtonsView
        )
        buttonsStackView.addArrangedSubviews(authButton, secondaryButton, toggleButton)
    }
    override func layoutViews() {
        super.layoutViews()
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(32)
            make.centerX.equalToSuperview()
        }
        credentialInputView.snp.makeConstraints { $0.height.equalTo(182) }
        authButton.snp.makeConstraints { $0.height.equalTo(50) }
        secondaryButton.snp.makeConstraints { $0.height.equalTo(40) }
        toggleButton.snp.makeConstraints { $0.height.equalTo(40) }
    }
    override func configureViews() {
        super.configureViews()
        appleButtonsView.addSelectors(
            target: self,
            signInSelector: #selector(signInAppleButtonTapped),
            signUpSelector: #selector(signUpAppleButtonTapped)
        )
        
        authButton.backgroundColor = App.color.accentColor
        authButton.titleLabel?.font = App.font.rubikBold(size: 20)
        authButton.tintColor = .white
        authButton.layer.cornerRadius = 10
        authButton.layer.borderWidth = 1
        authButton.layer.borderColor = App.color.accentColor.cgColor
        authButton.addTarget(self, action: #selector(authButtonTapped), for: .touchUpInside)
        
        toggleButton.titleLabel?.font = App.font.rubikBold(size: 16)
        toggleButton.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        
        secondaryButton.addTarget(self, action: #selector(secondaryButtonButtonTapped), for: .touchUpInside)
        secondaryButton.titleLabel?.font = App.font.rubikRegular(size: 11)
        secondaryButton.tintColor = App.color.label

    }
}

// MARK: - Actions
extension LoginViewController {
    @IBAction private func signInAppleButtonTapped() {
        appleLoginService.login { result in
            switch result {
            case .success(let result):
                print(result.fullName)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    @IBAction private func signUpAppleButtonTapped() { print(#function) }
    @IBAction private func authButtonTapped() { print(#function) }
    @IBAction private func secondaryButtonButtonTapped() { print(#function) }
    @IBAction private func toggleButtonTapped() {
        authHeaderView.toggle(with: currentLoginType)
        // TODO: to one view
        authButton.toggle(with: currentLoginType)
        toggleButton.toggle(with: currentLoginType)
        secondaryButton.toggle(with: currentLoginType)
    }
}
