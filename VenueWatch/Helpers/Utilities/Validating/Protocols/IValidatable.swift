//
//  Validatable.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/21/24.
//

import Foundation

protocol IValidatable {
    associatedtype ValueType
    associatedtype ErrorType
    func validate() -> ValidationResult<ValueType, ValidationError<ErrorType>>
}

struct ValidationError<T>: LocalizedError {
    var message: T
    var errorDescription: T? {
        message
    }
}

enum ValidationResult<ValidResult, IvalidResult> {
    case valid(ValidResult)
    case invalid(IvalidResult)
}
