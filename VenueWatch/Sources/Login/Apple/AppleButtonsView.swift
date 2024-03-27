//
//  AppleButtonsView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/19/24.
//

import UIKit
import AuthenticationServices

final class AppleButtonsView: BaseView {
    private let signInAppleButton = ASAuthorizationAppleIDButton(
        authorizationButtonType: .signIn,
        authorizationButtonStyle: .black
    )
    private let signUpAppleButton = ASAuthorizationAppleIDButton(
        authorizationButtonType: .signUp,
        authorizationButtonStyle: .black
    )
    func addSelectors(target: Any?, signInSelector: Selector, signUpSelector: Selector) {
        signUpAppleButton.addTarget(target, action: signUpSelector, for: .touchUpInside)
        signInAppleButton.addTarget(target, action: signInSelector, for: .touchUpInside)
    }
}

// MARK: - Configure
extension AppleButtonsView {
    override func setupViews() {
        super.setupViews()
        addSubviews(signInAppleButton, signUpAppleButton)
    }
    override func layoutViews() {
        super.layoutViews()
        signInAppleButton.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(self.snp.centerX).offset(-4)
            make.height.equalTo(40)
        }
        signUpAppleButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.leading.equalTo(self.snp.centerX).offset(4)
            make.height.equalTo(40)
        }
    }
    override func configureViews() {
        super.configureViews()
    }
}
