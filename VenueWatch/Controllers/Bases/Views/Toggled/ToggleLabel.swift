//
//  ToggleLabel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import UIKit

final class ToggleLabel: BaseLabel, Toggled {
    var titles: (signIn: String, signUp: String)?
    
    init(
        text: String? = nil,
        textColor: UIColor? = App.color.label,
        fontSize: CGFloat = 15,
        fontType: BaseLabel.FontType = .regular,
        textAlignment: NSTextAlignment = .left,
        lineBreakMode: NSLineBreakMode = .byWordWrapping,
        titles: (signIn: String, signUp: String)?
    ) {
        super.init(
            text: titles?.signUp,
            textColor: textColor,
            fontSize: fontSize,
            fontType: fontType,
            textAlignment: textAlignment,
            lineBreakMode: lineBreakMode
        )
        self.titles = titles
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func toggle(with type: LoginViewController.LoginType) {
        switch type {
        case .signIn: text = titles?.signUp
        case .signUp: text = titles?.signUp
        }
    }
}
