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
    
    private let mainStackView = BaseStackView(axis: .vertical)
    private let authHeaderView = AuthHeaderView()
    private let buttonsView = BaseView()
}

// MARK: - Configure
extension LoginViewController {
    override func setupViews() {
        super.setupViews()
        addSubviews(mainStackView)
        
        mainStackView.addArrangedSubviews(authHeaderView, buttonsView, appleButtonsView)
    }
    override func layoutViews() {
        super.layoutViews()
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(64)
        }
    }
    override func configureViews() {
        super.configureViews()
        appleButtonsView.addSelectors(
            signInSelector: #selector(onSignInAppleButtonTapped),
            signUpSelector: #selector(onSignUpAppleButtonTapped)
        )
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
}
