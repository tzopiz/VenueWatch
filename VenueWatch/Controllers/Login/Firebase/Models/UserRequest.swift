//
//  UserRequest.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

protocol UserRequestProtocol {
    var email: String { get }
    var password: String { get }
}
protocol SignUpProtocol: UserRequestProtocol {
    var username: String { get }
}

enum UserRequest {
    
    case signUp(SignUp)
    case signIn(SignIn)
    
    var body: UserRequestProtocol {
        switch self {
        case .signUp(let signUp): return signUp
        case .signIn(let signIn): return signIn
        }
    }
    struct SignUp: Codable, SignUpProtocol, Validatable {
        let username: String
        let email: String
        let password: String
        func validate() -> ValidationResult<SignUp> {
            
            let emailValidators = Validators.getFor([.email, .base])
            let passwordValidators = Validators.getFor([.password, .base])
            let usernameValidators = Validators.getFor([.username, .base])
            
            if Validators.isValid(email, emailValidators),
               Validators.isValid(password, passwordValidators),
               Validators.isValid(username, usernameValidators){
                return .valid(
                    UserRequest.SignUp(username: username, email: email, password: password)
                )
            }
            return .invalid(ValidationError(message: "Sign Up request is not valid"))
        }
    }
    struct SignIn: Codable, UserRequestProtocol, Validatable {
        let email: String
        let password: String
        func validate() -> ValidationResult<SignIn> {
            let emailValidators = Validators.getFor([.email, .base])
            let passwordValidators = Validators.getFor([.password, .base])
            print(email, password)
            if Validators.isValid(email, emailValidators),
               Validators.isValid(password, passwordValidators) {
                return .valid(
                    UserRequest.SignIn(email: email, password: password)
                )
            }
            return .invalid(ValidationError(message: "Sign In request is not valid"))
        }
    }
}
