//
//  Validatable.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/21/24.
//

import Foundation

protocol Validatable {
    associatedtype ValueType
    func validate() -> ValidationResult<ValueType>
}

enum ValidationResult<T> {
    case valid(T)
    case invalid(ValidationError)
}
