//
//  AuthTextField.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/19/24.
//

import UIKit

final class AuthTextField: BaseTextField {
    enum AuthTextFieldType {
        case username(placeholder: String = App.string.username())
        case email(placeholder: String = App.string.email())
        case password(placeholder: String = App.string.password())
    }
    init(type: AuthTextFieldType) {
        super.init(frame: .zero)
        let placeholder: String
        switch type {
        case .username(let value):
            placeholder = value
        case .email(let value):
            placeholder = value
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password(let value):
            placeholder = value
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
        configure(
            placeholder: placeholder,
            cornerRadius: 10,
            borderWidth: 1,
            borderColor: App.Color.separator.cgColor,
            textColor: App.Color.label,
            font: App.Font.rubik(style: .regular, size: 17),
            backgroundColor: App.Color.systemBackground
        )
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
