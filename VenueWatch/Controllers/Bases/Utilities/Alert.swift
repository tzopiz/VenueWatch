//
//  Alert.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation
import UIKit

extension Utilities.Alert {
    private static func showBasicAlert(
        _ vc: UIViewController,
        title: String, message: String?
    ) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
    
    // MARK: - Show Validation Alerts
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(vc, title: "Invalid Email", message: "Please enter a valid email.")
    }
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(vc, title: "Invalid Password", message: "Please enter a valid password.")
    }
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(vc, title: "Invalid Username", message: "Please enter a valid username.")
    }
    
    // MARK: - Registration Errors
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(vc, title: "Unknown Registration Error", message: nil)
    }
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: String) {
        self.showBasicAlert(vc, title: "Unknown Registration Error", message: "\(error)")
    }
    
    // MARK: - Log In Errors
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(vc, title: "Unknown Error Signing In", message: nil)
    }
    public static func showSignInErrorAlert(on vc: UIViewController, with error: String) {
        self.showBasicAlert(vc, title: "Error Signing In", message: "\(error)")
    }
    
    // MARK: - Logout Errors
    public static func showLogoutError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(vc, title: "Log Out Error", message: "\(error.localizedDescription)")
    }
    
    // MARK: - Forgot Password
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(vc, title: "Password Reset Sent", message: nil)
    }
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: String) {
        self.showBasicAlert(vc, title: "Error Sending Password Reset", message: "\(error)")
    }
    
    // MARK: - Fetching User Errors
    public static func showFetchingUserError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(vc, title: "Error Fetching User", message: "\(error.localizedDescription)")
    }
    public static func showUnknownFetchingUserError(on vc: UIViewController) {
        self.showBasicAlert(vc, title: "Unknown Error Fetching User", message: nil)
    }
}

