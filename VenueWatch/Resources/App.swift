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
    enum FontStyle {
        case black, blackItalic, bold, lightItalic, medium
        case boldItalic, italic, light, mediumItalic, regular
    }
    enum Font {
        static func rubik(style fontStyle: App.FontStyle, size fontSize: CGFloat) -> UIFont? {
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
    enum Color {
        static let uicolor = UIColor()
        static let separator = UIColor.separator
        static let systemBackground = UIColor.systemBackground
        static let secondarySystemBackground = UIColor.secondarySystemBackground
        static let label = UIColor.label
        static let secondaryLabel = UIColor.secondaryLabel
        static let accentColor = UIColor.systemBlue
        static let red = UIColor.systemRed
    }
    
    // MARK: - Images
    enum Image {
        static let notes =  UIImage(systemName: "house")
        static let map = UIImage(systemName: "map")
        static let friends = UIImage(systemName: "person.2.wave.2")
        static let profile = UIImage(systemName: "person.crop.rectangle.stack")
        static let notesFill = UIImage(systemName: "house.fill")
        static let mapFill = UIImage(systemName: "map.fill")
        static let friendsFill = UIImage(systemName: "person.2.wave.2.fill")
        static let profileFill = UIImage(systemName: "person.crop.rectangle.stack.fill")
        static let logo = UIImage(systemName: "mappin.and.ellipse")
        static let emptyProfile = UIImage(systemName: "person.crop.circle")
        
        static let likes = UIImage(systemName: "hand.thumbsup")
        static let dislike = UIImage(systemName: "hand.thumbsdown")
        static let comment = UIImage(systemName: "text.bubble")
        static let share = UIImage(systemName: "arrowshape.turn.up.forward")
        
        static let likesFill = UIImage(systemName: "hand.thumbsup.fill")
        static let dislikeFill = UIImage(systemName: "hand.thumbsdown.fill")
        static let commentFill = UIImage(systemName: "text.bubble.fill")
        static let shareFill = UIImage(systemName: "arrowshape.turn.up.forward.fill")
        
        static let testImages: Array<UIImage?> = [
            R.image.image1(),  R.image.image2(),  R.image.image3(),  R.image.image4(),
            R.image.image5(),  R.image.image6(),  R.image.image7(),  R.image.image8(),
            R.image.image9(),  R.image.image10(), R.image.image11(), R.image.image12(),
            R.image.image13(), R.image.image14()
        ]
    }
}
