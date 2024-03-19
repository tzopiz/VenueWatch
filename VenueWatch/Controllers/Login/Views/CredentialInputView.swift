//
//  CredentialInputView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/19/24.
//

import UIKit

final class CredentialInputView: BaseView {
    private let usernameTextField = AuthTextField(type: .username())
    private let emailTextField = AuthTextField(type: .email())
    private let passwordTextField = AuthTextField(type: .password())
}

// MARK: - Configure
extension CredentialInputView {
    override func setupViews() {
        super.setupViews()
        addSubviews(usernameTextField, emailTextField, passwordTextField)
    }
    override func layoutViews() {
        super.layoutViews()
        usernameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(50)
        }
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(usernameTextField.snp.bottom).offset(16)
        }
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.height.equalTo(50)
        }
    }
    override func configureViews() {
        super.configureViews()
    }
}
