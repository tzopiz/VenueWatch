//
//  UserRequset.SignIn.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/24/24.
//

import Foundation

protocol ISignInRequest: IUserRequest {
    var email: String? { get }
    var password: String? { get }
}

extension UserRequest {
    struct SignIn: Codable, ISignInRequest, IValidatable {
        let email: String?
        let password: String?
        func validate() -> ValidationResult<SignIn, ValidationError<Array<String>>> {
            var errors = ValidationError<Array<String>>(message: Array<String>())
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
