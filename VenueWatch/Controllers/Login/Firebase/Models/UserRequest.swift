//
//  UserRequest.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

enum UserRequest {
    struct Register: Codable {
        let email: String
        let username: String
        let password: String
    }
    struct SignIn: Codable {
        let email: String
        let password: String
    }
}
