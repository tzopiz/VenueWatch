//
//  Validators.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/21/24.
//

import Foundation

struct ValidationError: LocalizedError {
    var message: String
    public var errorDescription: String? {
        message
    }
}

protocol Validator {
    associatedtype ValueType
    var errorMessage: String { get }
    func isValid(value: ValueType?) -> Bool
}

extension Validator {
    func validate(value: ValueType?) throws {
        if !isValid(value: value) {
            throw ValidationError(message: errorMessage)
        }
    }
}

struct RegexValidator: Validator, Hashable {
    public var errorMessage: String
    private var regex: String
    public init(regex: String, errorMessage: String) {
        self.regex = regex
        self.errorMessage = errorMessage
    }
    public func isValid(value: String?) -> Bool {
        guard let v = value else { return false }
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: v)
    }
}

enum Validators {
    enum ValidatorType {
        case email
        case username
        case password
        case base
    }
    private static let emailValidator = RegexValidator(
        regex: "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
        errorMessage: "Invalid email"
    )
    private static let passwordValidator = RegexValidator(
        regex: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$",
        errorMessage: "Invalid password"
    )
    private static let usernameValidator = RegexValidator(
        regex: "^\\w{4,}$",
        errorMessage: "Invalid username"
    )
    private static let baseValidator = RegexValidator(
        regex: #"^.{2,64}$"#,
        errorMessage: "String is not valid"
    )
    static func getFor(_ validators: Array<ValidatorType>) -> Set<RegexValidator> {
        var selectedValidators = Set<RegexValidator>()
        for validator in validators {
            switch validator {
            case .email: selectedValidators.insert(emailValidator)
            case .username: selectedValidators.insert(usernameValidator)
            case .password: selectedValidators.insert(passwordValidator)
            case .base: selectedValidators.insert(baseValidator)
            }
        }
        return selectedValidators
    }
    static func isValid(_ str: String, _ validators: Set<RegexValidator>) -> Bool {
        for validator in validators where !validator.isValid(value: str) {
            return false
        }
        return true
    }
}

