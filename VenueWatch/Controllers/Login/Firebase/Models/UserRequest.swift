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
    struct SignUp: Codable, SignUpProtocol {
        let username: String
        let email: String
        let password: String
    }
    struct SignIn: Codable, UserRequestProtocol {
        let email: String
        let password: String
    }
}
