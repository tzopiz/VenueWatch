//
//  Validator.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/23/24.
//

import Foundation

// MARK: - For future feathers:
// MARK: @propertyWrapper, combine and react -
protocol Validator {
    associatedtype ValueType
    associatedtype ErrorType
    var errorMessage: ErrorType { get }
    func isValid(value: ValueType) -> Bool
}

extension Validator {
    func validate(value: ValueType) -> ValidationResult<ValueType, ErrorType> {
        if !isValid(value: value) { return .invalid(errorMessage) }
        return .valid(value)
    }
}

struct RegexValidator: Validator, Hashable {
    
    var errorMessage: String
    private var regex: String
    
    init(regex: String, errorMessage: String) {
        self.regex = regex
        self.errorMessage = errorMessage
    }
    
    func isValid(value: String?) -> Bool {
        guard let value = value else { return false }
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: value)
    }
}
