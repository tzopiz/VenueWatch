//
//  Validators.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/21/24.
//

import Foundation

extension Utilities.Validators {
    enum ValidatorType {
        case email(value: String = App.string.email())
        case username(value: String = App.string.username())
        case password(value: String = App.string.password())
    }
    
    static func isValid(_ str: String?, type: ValidatorType) -> ValidationResult<String, String> {
        switch type {
        case .email: return isValidEmail(str)
        case .password: return isValidPassword(str)
        case .username: return isValidUsername(str)
        }
    }
    
    internal static let emailValidator = RegexValidator(
        regex: "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
        errorMessage: "Invalid email"
    )
    internal static let passwordValidator = RegexValidator(
        regex: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&_()-])[A-Za-z\\d@$!%*?&_()-]{8,}$",
        errorMessage: "Invalid password"
    )
    internal static let usernameValidator = RegexValidator(
        regex: "^\\w{4,}$",
        errorMessage: "Invalid username"
    )
    
    internal static func isValidPassword(_ password: String?) -> ValidationResult<String, String> {
        guard let password = password, password.contains(where: { $0.isUppercase })
        else { return .invalid(App.string.noUppercaseLetter()) }
        guard password.contains(where: { $0.isLowercase })
        else { return .invalid(App.string.noLowercaseLetter()) }
        guard password.contains(where: { $0.isNumber })
        else { return .invalid(App.string.noDigit()) }
        let specialCharacters = CharacterSet(charactersIn: "!?@#$%^&*()-_")
        guard password.rangeOfCharacter(from: specialCharacters) != nil
        else { return .invalid(App.string.noSpecialCharacter()) }
        guard password.count >= 8 && password.count <= 64
        else { return .invalid(App.string.insufficientLength()) }
        return .valid(password)
    }
    
    internal static func isValidEmail(_ email: String?) -> ValidationResult<String, String> {
        guard let email = email, !email.isEmpty
        else { return .invalid("Email cannot be empty") }
        guard email.range(
            of: "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
            options: .regularExpression
        ) != nil
        else { return .invalid("Invalid email format") }
        return .valid(email)
    }
    
    internal static func isValidUsername(_ username: String?) -> ValidationResult<String, String> {
        guard let username = username, !username.isEmpty
        else { return .invalid("Username cannot be empty") }
        guard username.range(
            of: #"^\w{4,}$"#,
            options: .regularExpression
        ) != nil
        else { return .invalid("Invalid username format") }
        return .valid(username)
    }
}
