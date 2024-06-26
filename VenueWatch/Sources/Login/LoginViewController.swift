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
final class LoginViewController: BaseViewController<LoginViewModel> {
    
    private let authHeaderView: AuthHeaderView
    private let credentialInputView: CredentialInputView
    private let footerButtonsView: FooterButtonsView
    private let appleButtonsView = AppleButtonsView()
    private let mainStackView = BaseStackView(axis: .vertical, spacing: 16)
    
    override init(viewModel: LoginViewModel) {
        credentialInputView = CredentialInputView(type: viewModel.currentLoginType)
        footerButtonsView = FooterButtonsView(type: viewModel.currentLoginType)
        authHeaderView = AuthHeaderView(type: viewModel.currentLoginType)
        super.init(viewModel: viewModel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    override func setupViews() {
        super.setupViews()
        view.addSubviews(mainStackView)
        mainStackView.addArrangedSubviews(
            authHeaderView, credentialInputView, footerButtonsView, appleButtonsView
        )
    }
    override func layoutViews() {
        super.layoutViews()
        credentialInputView.snp.makeConstraints { $0.height.equalTo(credentialInputView.height) }
        footerButtonsView.snp.makeConstraints { $0.height.equalTo(footerButtonsView.height) }
        mainStackView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(16)
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
        footerButtonsView.buttonTapHandler = { [weak self] viewController, animated in
            guard let self = self else { return }
            viewModel.navigationDelegate?.presentViewController(viewController, animated: animated)
        }
        viewModel.loginTypeChanged = { [weak self] loginType in
            guard let self = self,
                  let navigationController = self.navigationController
            else { return }
            let loginViewModel = LoginViewModel(currentLoginType: loginType)
            let loginViewController = LoginViewController(viewModel: loginViewModel)
            UIView.transition(
                with: navigationController.view, duration: 0.5,
                options: loginType == .signIn ? .transitionFlipFromRight : .transitionFlipFromLeft,
                animations: {
                    navigationController.viewControllers.removeLast()
                    navigationController.viewControllers.append(loginViewController)
                }, completion: nil)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Actions
extension LoginViewController {
    @IBAction private func signInAppleButtonTapped() {
        Utilities.Alert.functionIsBeingDeveloped(on: self)
    }
    @IBAction private func signUpAppleButtonTapped() {
        Utilities.Alert.functionIsBeingDeveloped(on: self)
    }
    @IBAction private func authButtonTapped() {
        let credential = credentialInputView.credential.body
        var userRequest: URLRequest?
        if let credential = credential as? UserRequest.SignUp,
           let request = APIRequest.createAccount(userRequest: credential).request {
            switch credential.validate() {
            case .invalid(let errors):
                Utilities.Alert.showAlert(
                    self,
                    title: App.string.signUp(),
                    message: errors.message.joined(separator: "\n"))
            case .valid:
                userRequest = request
            }
        }
        if let credential = credential as? UserRequest.SignIn,
           let request = APIRequest.signIn(userRequest: credential).request {
            switch credential.validate() {
            case .invalid(let errors):
                Utilities.Alert.showAlert(
                    self,
                    title: App.string.signIn(),
                    message: errors.message.joined(separator: "\n"))
            case .valid:
                userRequest = request
            }
        }
        performRequest(userRequest)
    }
    private func performRequest(_ userRequest: URLRequest?) {
        guard let userRequest = userRequest else { return }
        Task {
            do {
                let result = try await viewModel.authService.fetch(request: userRequest)
                print(result)
            } catch {
                print(#function, error.localizedDescription)
                Utilities.Alert.functionIsBeingDeveloped(on: self)
            }
        }
    }
    @IBAction private func secondaryButtonButtonTapped() {
        Utilities.Alert.functionIsBeingDeveloped(on: self)
    }
    @IBAction private func toggleButtonTapped() {
        viewModel.toggleCurrentLoginType()
    }
    @IBAction private func hideKeyboard() {
        credentialInputView.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
