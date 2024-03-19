//
//  App.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import Foundation
import UIKit

enum App {
    enum DeviceTheme {
        case light, dark
    }
    static func getCurrentDeviceTheme() -> DeviceTheme {
        let userInterfaceStyle = UIScreen.main.traitCollection.userInterfaceStyle
        switch userInterfaceStyle {
        case .light: return .light
        default: return .dark
        }
    }
    static let string = R.string.localization(
        preferredLanguages: [UserDefaults.standard.preferredLanguage]
    )
    static let font = R.font
    static let image = R.image
    enum color {
        static let separator = UIColor.separator
        static let systemBackground = UIColor.systemBackground
        static let secondarySystemBackground = UIColor.secondarySystemBackground 
        static let label = UIColor.label
        static let secondaryLabel = UIColor.secondaryLabel
        static let accentColor = UIColor.systemBlue
    }
}

