//
//  Alert.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation
import UIKit

extension Utilities.Alert {
    typealias AlertType = Utilities.Validators.ValidatorType
    static func showAlert(
        _ vc: UIViewController,
        title: String,
        message: String? = nil
    ) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
    
    // MARK: - Show the function is in development
    public static func functionIsBeingDeveloped(on vc: UIViewController) {
        self.showAlert(
            vc,
            title: App.string.attention(),
            message: App.string.functionIsBeingDeveloped()
        )
    }
    
    // MARK: - Show Validation Alerts
    public static func showInvalidAlert(on vc: UIViewController, _ type: AlertType) {
        let title: String
        switch type {
        case .email: title = App.string.invalidArg1(App.string.email())
        case .password: title = App.string.invalidArg1(App.string.password())
        case .username: title = App.string.invalidArg1(App.string.username())
        }
        let message = App.string.enterAValidArg1(App.string.email())
        self.showAlert(vc, title: title, message: message)
    }
    
    // MARK: - Registration Errors
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showAlert(vc, title: "Unknown Registration Error", message: nil)
    }
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: String) {
        self.showAlert(vc, title: "Unknown Registration Error", message: "\(error)")
    }
    
    // MARK: - Log In Errors
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showAlert(vc, title: "Unknown Error Signing In", message: nil)
    }
    public static func showSignInErrorAlert(on vc: UIViewController, with error: String) {
        self.showAlert(vc, title: "Error Signing In", message: "\(error)")
    }
    
    // MARK: - Logout Errors
    public static func showLogoutError(on vc: UIViewController, with error: Error) {
        self.showAlert(vc, title: "Log Out Error", message: "\(error.localizedDescription)")
    }
    
    // MARK: - Forgot Password
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showAlert(vc, title: "Password Reset Sent", message: nil)
    }
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: String) {
        self.showAlert(vc, title: "Error Sending Password Reset", message: "\(error)")
    }
    
    // MARK: - Fetching User Errors
    public static func showFetchingUserError(on vc: UIViewController, with error: Error) {
        self.showAlert(vc, title: "Error Fetching User", message: "\(error.localizedDescription)")
    }
    public static func showUnknownFetchingUserError(on vc: UIViewController) {
        self.showAlert(vc, title: "Unknown Error Fetching User", message: nil)
    }
}
