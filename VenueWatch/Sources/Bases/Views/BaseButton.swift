//
//  BaseButton.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import UIKit

class BaseButton: UIButton {
    convenience init() {
        self.init(type: .system)
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        titleLabel?.font = App.Font.rubik(style: .regular, size: 15)
        titleLabel?.textColor = App.Color.label
    }
}
