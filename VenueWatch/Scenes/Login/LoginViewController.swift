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
    private let mainStackView = BaseStackView(axis: .vertical, spacing: 16)
    
    private lazy var appleLoginService = AppleLoginService()
    private lazy var authService = AuthService()
    
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
        
        footerButtonsView.delegate = self
        
        for subview in view.subviews {
            if let textField = subview as? AuthTextField {
                textField.delegate = self
            }
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Actions
extension LoginViewController {
    @IBAction private func signInAppleButtonTapped() {
        appleLoginService.login { result in
            switch result {
            case .success(let result): print(result.fullName)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    @IBAction private func signUpAppleButtonTapped() { print(#function) }
    @IBAction private func authButtonTapped() {
        let credential = credentialInputView.credential.body
        var userRequest: URLRequest?
        if let credential = credential as? UserRequest.SignUp,
           let request = APIRequest.createAccount(userRequest: credential).request {
            switch credential.validate() {
            case .invalid(let errors):
                print("APIRequest.SignUp.Error:\n")
                errors.message.forEach { print($0) }
            case .valid(_):
                userRequest = request
            }
        }
        if let credential = credential as? UserRequest.SignIn,
           let request = APIRequest.signIn(userRequest: credential).request {
            switch credential.validate() {
            case .invalid(let errors):
                print("APIRequest.SignIn.Error:\n")
                errors.message.forEach { print($0) }
            case .valid(_):
                userRequest = request
            }
        }
        performRequest(userRequest)
    }
    private func performRequest(_ userRequest: URLRequest?) {
        guard let userRequest = userRequest else { return }
        Task {
            do {
                let result = try await authService.fetch(request: userRequest)
                print(result)
            } catch {
                Utilities.Alert.showAlert(self, title: #function, message: error.localizedDescription)
            }
        }
    }
    @IBAction private func secondaryButtonButtonTapped() {
        // TODO: recreate password
    }
    @IBAction private func toggleButtonTapped() {
        guard let navigationController = self.navigationController else { return }
        currentLoginType.toggle()
        navigationController.presentLoginViewController(for: currentLoginType)
    }
    @IBAction func hideKeyboard() {
        credentialInputView.endEditing(true)
    }
}

// MARK: - PresentDelegate
extension LoginViewController {
    override func present(viewController: UIViewController, animated: Bool) {
        self.present(viewController, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        credentialInputView.endEditing(true)
        return true
    }
}
