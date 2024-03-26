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
    private lazy var appleLoginService = AppleLoginService()
    private lazy var authService = AuthService()
    
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
            self.viewModel.presentHandler?(viewController, animated)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Actions
extension LoginViewController {
    @IBAction public func signInAppleButtonTapped() {
        appleLoginService.login { result in
            switch result {
            case .success(let result): print(result.fullName)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    @IBAction private func signUpAppleButtonTapped() { }
    @IBAction public func authButtonTapped() {
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
    internal func performRequest(_ userRequest: URLRequest?) {
        guard let userRequest = userRequest else { return }
        Task {
            do {
                let result = try await authService.fetch(request: userRequest)
                print(result)
            } catch {
                print(#function, error.localizedDescription)
                Utilities.Alert.functionIsBeingDeveloped(on: self)
            }
        }
    }
    @IBAction internal func secondaryButtonButtonTapped() {
        Utilities.Alert.functionIsBeingDeveloped(on: self)
    }
    @IBAction public func toggleButtonTapped() {
        guard let navigationController = self.navigationController else { return }
        viewModel.toggleCurrentLoginType()
        navigationController.presentLoginViewController(for: viewModel.currentLoginType)
    }
    @IBAction func hideKeyboard() {
        viewModel.textFieldShouldReturn(credentialInputView)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel.textFieldShouldReturn(textField)
        return true
    }
}
