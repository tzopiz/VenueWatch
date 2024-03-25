//
//  UserRequest.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

protocol UserRequestProtocol { }

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
}

