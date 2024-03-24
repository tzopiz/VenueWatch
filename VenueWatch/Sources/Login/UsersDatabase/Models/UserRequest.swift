//
//  UserRequest.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

protocol UserRequestProtocol {
    var email: String? { get }
    var password: String? { get }
}
protocol SignUpProtocol: UserRequestProtocol {
    var username: String? { get }
}

enum UserRequest {
    typealias Validators = Utilities.Validators
    case signUp(SignUp)
    case signIn(SignIn)
    var body: UserRequestProtocol {
        switch self {
        case .signUp(let signUp): return signUp
        case .signIn(let signIn): return signIn
        }
    }
    struct SignUp: Codable, SignUpProtocol, Validatable {
        let username: String?
        let email: String?
        let password: String?
        func validate() -> ValidationResult<SignUp, ValidationError<[String]>> {
            var errors = ValidationError<[String]>(message: [String]())
            let validators: [(String?, Validators.ValidatorType)] = [
                (email, .email()),
                (password, .password()),
                (username, .username())
            ]
            for (value, type) in validators {
                guard case let .invalid(error) = Validators.isValid(value, type: type)
                else { continue }
                errors.message.append(error)
            }
            guard errors.message.isEmpty else { return .invalid(errors) }
            return .valid(UserRequest.SignUp(username: username, email: email, password: password))
        }
    }

    struct SignIn: Codable, UserRequestProtocol, Validatable {
        let email: String?
        let password: String?
        func validate() -> ValidationResult<SignIn, ValidationError<[String]>> {
            var errors = ValidationError<[String]>(message: [String]())
            let validators: [(String?, Validators.ValidatorType)] = [
                (email, .email()),
                (password, .password())
            ]
            for (value, type) in validators {
                guard case let .invalid(error) = Validators.isValid(value, type: type)
                else { continue }
                errors.message.append(error)
            }
            guard errors.message.isEmpty else { return .invalid(errors) }
            return .valid(UserRequest.SignIn(email: email, password: password))
        }
    }
}
