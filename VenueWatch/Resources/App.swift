//
//  App.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import Foundation

enum App {
    static let string = R.string.localization(
        preferredLanguages: [UserDefaults.standard.preferredLanguage]
    )
    static let font = R.font
    static let color = R.color
}

