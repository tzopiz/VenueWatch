//
//  CredentialInputView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/19/24.
//

import UIKit

final class CredentialInputView: BaseView {
    
    private let usernameTextField: AuthTextField?
    private let emailTextField: AuthTextField = AuthTextField(type: .email())
    private let passwordTextField: AuthTextField = AuthTextField(type: .password())
    
    let height: CGFloat
    
    init(type: LoginType) {
        switch type {
        case .signIn:
            usernameTextField = nil
            height = 132
        case .signUp:
            usernameTextField = AuthTextField(type: .username())
            height = 182
        }
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension CredentialInputView {
    override func setupViews() {
        super.setupViews()
        if let usernameTextField = usernameTextField {
            addSubviews(usernameTextField)
        }
        addSubviews(emailTextField, passwordTextField)
    }
    override func layoutViews() {
        super.layoutViews()
        if let usernameTextField = usernameTextField {
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
        } else {
            emailTextField.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(50)
                make.top.equalToSuperview()
            }
        }
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.height.equalTo(50)
        }
    }
}
