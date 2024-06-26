//
//  Alert.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import UIKit

extension Utilities.Alert {
    typealias AlertType = Utilities.Validators.ValidatorType
    static func showAlert(
        _ viewController: UIViewController,
        title: String,
        message: String? = nil
    ) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            viewController.present(alert, animated: true)
        }
    }
    
    // MARK: - Show the function is in development
    static func functionIsBeingDeveloped(on viewController: UIViewController) {
        self.showAlert(
            viewController,
            title: App.string.attention(),
            message: App.string.functionIsBeingDeveloped()
        )
    }
    
    // MARK: - Show Validation Alerts
    static func showInvalidAlert(on viewController: UIViewController, _ type: AlertType) {
        let title: String
        switch type {
        case .email: title = App.string.invalidArg1(App.string.email())
        case .password: title = App.string.invalidArg1(App.string.password())
        case .username: title = App.string.invalidArg1(App.string.username())
        }
        let message = App.string.enterAValidArg1(App.string.email())
        self.showAlert(viewController, title: title, message: message)
    }
    
    // MARK: - Registration Errors
    static func showRegistrationErrorAlert(on viewController: UIViewController) {
        self.showAlert(viewController, title: "Unknown Registration Error", message: nil)
    }
    static func showRegistrationErrorAlert(on viewController: UIViewController, with error: String) {
        self.showAlert(viewController, title: "Unknown Registration Error", message: "\(error)")
    }
    
    // MARK: - Log In Errors
    static func showSignInErrorAlert(on viewController: UIViewController) {
        self.showAlert(viewController, title: "Unknown Error Signing In", message: nil)
    }
    static func showSignInErrorAlert(on viewController: UIViewController, with error: String) {
        self.showAlert(viewController, title: "Error Signing In", message: "\(error)")
    }
    
    // MARK: - Logout Errors
    static func showLogoutError(on viewController: UIViewController, with error: Error) {
        self.showAlert(viewController, title: "Log Out Error", message: "\(error.localizedDescription)")
    }
    
    // MARK: - Forgot Password
    static func showPasswordResetSent(on viewController: UIViewController) {
        self.showAlert(viewController, title: "Password Reset Sent", message: nil)
    }
    static func showErrorSendingPasswordReset(on viewController: UIViewController, with error: String) {
        self.showAlert(viewController, title: "Error Sending Password Reset", message: "\(error)")
    }
    
    // MARK: - Fetching User Errors
    static func showFetchingUserError(on viewController: UIViewController, with error: Error) {
        self.showAlert(viewController, title: "Error Fetching User", message: "\(error.localizedDescription)")
    }
    static func showUnknownFetchingUserError(on viewController: UIViewController) {
        self.showAlert(viewController, title: "Unknown Error Fetching User", message: nil)
    }
}
