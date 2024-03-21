//
//  App.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import Foundation
import UIKit
import CloudKit

enum App {
    enum DeviceTheme {
        case light, dark
    }
    static func getCurrentDeviceTheme() -> DeviceTheme {
        let userInterfaceStyle = UIScreen.main.traitCollection.userInterfaceStyle
        switch userInterfaceStyle {
        case .light:
            return .light
        default:
            return .dark
        }
    }
    static let string = R.string.localization(
        preferredLanguages: [UserDefaults.standard.preferredLanguage]
    )
    static let font = R.font
    static let color = R.color
}

