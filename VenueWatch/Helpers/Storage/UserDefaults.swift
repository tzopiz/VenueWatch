//
//  UserDefaults.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import Foundation

extension UserDefaults {
    var preferredLanguage: String {
        get { UserDefaults.standard.string(forKey: "preferredLanguage") ?? "ru" }
        set { UserDefaults.standard.set(newValue, forKey: "preferredLanguage") }
    }
}
