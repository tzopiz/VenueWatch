//
//  LoginViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import UIKit

enum LoginType {
    case signIn, signUp
    mutating func toggle() {
        switch self {
        case .signIn: self = .signUp
        case .signUp: self = .signIn
        }
    }
}
final class LoginViewController: BaseViewController {
    private var currentLoginType: LoginType
    
    private let authHeaderView: AuthHeaderView
    private let credentialInputView: CredentialInputView
    private let footerButtonsView: FooterButtonsView
    
    private let appleButtonsView = AppleButtonsView()
    private let appleLoginService = AppleLoginService()
    
    private let mainStackView = BaseStackView(axis: .vertical, spacing: 16)
    
    init(currentLoginType: LoginType) {
        self.currentLoginType = currentLoginType
        credentialInputView = CredentialInputView(type: currentLoginType)
        footerButtonsView = FooterButtonsView(type: currentLoginType)
        authHeaderView = AuthHeaderView(type: currentLoginType)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension LoginViewController {
    override func setupViews() {
        super.setupViews()
        addSubviews(mainStackView)
        mainStackView.addArrangedSubviews(
            authHeaderView, credentialInputView, footerButtonsView, appleButtonsView
        )
    }
    override func layoutViews() {
        super.layoutViews()
        
        credentialInputView.snp.makeConstraints { $0.height.equalTo(credentialInputView.height) }
        footerButtonsView.snp.makeConstraints { $0.height.equalTo(footerButtonsView.height) }
        
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(64)
            make.centerX.equalToSuperview()
        }
    }
    override func configureViews() {
        super.configureViews()
        appleButtonsView.addSelectors(
            target: self,
            signInSelector: #selector(signInAppleButtonTapped),
            signUpSelector: #selector(signUpAppleButtonTapped)
        )
        footerButtonsView.addSelectos(
            target: self,
            authButtonSelector: #selector(authButtonTapped),
            secondarySelector: #selector(secondaryButtonButtonTapped),
            toggleButtonSelector: #selector(toggleButtonTapped)
        )
        footerButtonsView.delegate = self
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
        switch currentLoginType {
        case .signIn:
            let vc = LoginViewController(currentLoginType: .signUp)
            UIApplication.shared.keyWindow?.switchRootViewController(vc)
        case .signUp:
            let vc = LoginViewController(currentLoginType: .signIn)
            UIApplication.shared.keyWindow?.switchRootViewController(vc)
        }
        currentLoginType.toggle()
    }
}

extension LoginViewController {
    override func present(viewController: UIViewController, animated: Bool) {
        self.present(viewController, animated: true)
    }
}
