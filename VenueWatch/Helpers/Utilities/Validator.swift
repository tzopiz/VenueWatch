//
//  Validator.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

extension Utilities.Validator {
    // TODO: create propertyWrapper Validator
    enum DataType {
        case password(regex: String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{6,32}$")
        case email(regex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}")
        case username(regex: String = "\\w{4,24}")
        
        var regex: String {
            switch self {
            case .password(let regex),
                 .email(let regex),
                 .username(let regex):
                return regex
            }
        }
    }
    public static func isValid(_ str: String, _ type: DataType) -> Bool {
        let str = str.trimmingCharacters(in: .whitespacesAndNewlines)
        let predicate = NSPredicate(format: "SELF MATCHES %@", type.regex)
        return predicate.evaluate(with: str)
    }
}
