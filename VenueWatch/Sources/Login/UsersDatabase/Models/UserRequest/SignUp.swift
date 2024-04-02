//
//  SignUp.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/24/24.
//

import Foundation

protocol ISignUpRequest: IUserRequest {
    var email: String? { get }
    var password: String? { get }
    var username: String? { get }
}
extension UserRequest {
    struct SignUp: Codable, ISignUpRequest, IValidatable {
        let username: String?
        let email: String?
        let password: String?
        func validate() -> ValidationResult<SignUp, ValidationError<Array<String>>> {
            var errors = ValidationError<Array<String>>(message: Array<String>())
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
}
