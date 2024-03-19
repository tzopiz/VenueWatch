//
//  Toggled.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import Foundation

protocol Toggled {
    var titles: (signIn: String, signUp: String)? { get }
    func toggle(with type: LoginViewController.LoginType)
}
