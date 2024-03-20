//
//  ToggleButton.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/19/24.
//

import UIKit

final class ToggleButton: UIButton, Toggled {
    var titles: (signIn: String, signUp: String)?
    func toggle(with type: LoginType) {
        switch type {
        case .signIn: break
        case .signUp: break
        }
    }
    private func setToggleTitle(with type: LoginType) {
        switch type {
        case .signIn: setTitle(titles?.signIn, for: .normal)
        case .signUp: setTitle(titles?.signUp, for: .normal)
        }
    }
    convenience init(
        type: LoginType = .signUp,
        titles: (signIn: String, signUp: String)
    ) {
        self.init(type: .system)
        self.titles = titles
        setToggleTitle(with: type)
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
    }
}
