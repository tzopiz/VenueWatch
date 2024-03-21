//
//  BaseButton.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import UIKit

class BaseButton: UIButton {
    convenience init(_ title: String? = nil) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
    }
}
