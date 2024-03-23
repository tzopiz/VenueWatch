//
//  App.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import Foundation
import UIKit

enum App {
    
    // MARK: - Theme
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
    
    // MARK: - Localizations
    static var currentLanguage: String {
        return UserDefaults.standard.preferredLanguage
    }
    static let string = R.string.localization(
        preferredLanguages: [App.currentLanguage]
    )
    
    // MARK: - Fonts
    enum font {
        enum FontStyle {
            case black, blackItalic, bold, lightItalic, medium
            case boldItalic, italic, light, mediumItalic, regular
        }
        static func rubik(style fontStyle: FontStyle, size fontSize: CGFloat) -> UIFont? {
            switch fontStyle {
            case .italic:       return R.font.rubikItalic(size: fontSize)
            case .light:        return R.font.rubikLight(size: fontSize)
            case .regular:      return R.font.rubikRegular(size: fontSize)
            case .bold:         return R.font.rubikBold(size: fontSize)
            case .black:        return R.font.rubikBlack(size: fontSize)
            case .blackItalic:  return R.font.rubikBlackItalic(size: fontSize)
            case .lightItalic:  return R.font.rubikLightItalic(size: fontSize)
            case .medium:       return R.font.rubikMedium(size: fontSize)
            case .boldItalic:   return R.font.rubikBoldItalic(size: fontSize)
            case .mediumItalic: return R.font.rubikMediumItalic(size: fontSize)
            }
        }
    }
    
    // MARK: - Colors
    enum color {
        static let uicolor = UIColor()
        static let separator = UIColor.separator
        static let systemBackground = UIColor.systemBackground
        static let secondarySystemBackground = UIColor.secondarySystemBackground 
        static let label = UIColor.label
        static let secondaryLabel = UIColor.secondaryLabel
        static let accentColor = UIColor.systemBlue
    }
    enum images {
        static let notes =  UIImage(systemName: "house")
        static let map = UIImage(systemName: "map")
        static let friends = UIImage(systemName: "person.2.wave.2")
        static let profile = UIImage(systemName: "person.crop.rectangle.stack")
        
        static let notes_fill = UIImage(systemName: "house.fill")
        static let map_fill = UIImage(systemName: "map.fill")
        static let friends_fill = UIImage(systemName: "person.2.wave.2.fill")
        static let profile_fill = UIImage(systemName: "person.crop.rectangle.stack.fill")
    }
}
