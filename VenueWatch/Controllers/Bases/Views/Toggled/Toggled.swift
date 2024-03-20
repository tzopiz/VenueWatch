//
//  Toggled.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import Foundation

enum LoginType {
    case signIn
    case signUp
    mutating func toggle() {
        switch self {
        case .signIn: self = .signUp
        case .signUp: self = .signIn
        }
    }
}

protocol Toggled {
    var titles: (signIn: String, signUp: String)? { get }
    func toggle(with type: LoginType)
}
