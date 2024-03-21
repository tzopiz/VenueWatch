//
//  ValidatorTests.swift
//  VenueWatchTests
//
//  Created by Дмитрий Корчагин on 3/21/24.
//

import XCTest
@testable import VenueWatch

final class ValidatorTests: XCTestCase {
    
    private let baseValidator = Validators.getFor([.base]).first!
    private let emailValidator = Validators.getFor([.email]).first!
    private let usernameValidator = Validators.getFor([.username]).first!
    private let passwordValidator = Validators.getFor([.password]).first!
    
    func testValidBaseValidator() {
        XCTAssertTrue(baseValidator.isValid(value: "1234567890123456789012"))
        XCTAssertTrue(baseValidator.isValid(value: "Hello"))
        XCTAssertTrue(baseValidator.isValid(value: "This string is too long This string is too long"))
    }
    func testInvalidBaseValidator() {
        XCTAssertFalse(baseValidator.isValid(value: String(Array<Character>(repeating: "a", count: 65))))
        XCTAssertFalse(baseValidator.isValid(value: ""))
        XCTAssertFalse(baseValidator.isValid(value: nil))
    }
    
    func testValidPasswordValidator() {
        XCTAssertTrue(passwordValidator.isValid(value: "StrongPassword123?"))
        XCTAssertTrue(passwordValidator.isValid(value: "SecurePwd456@"))
        XCTAssertTrue(passwordValidator.isValid(value: "MyPass123!"))
        XCTAssertTrue(passwordValidator.isValid(value: "MyPass123!"))
        XCTAssertTrue(passwordValidator.isValid(value: "StrongPwd!2022"))
        XCTAssertTrue(passwordValidator.isValid(value: "SafePassword99%"))
    }
    func testInvalidPasswordValidator() {
        XCTAssertFalse(passwordValidator.isValid(value: nil))
        XCTAssertFalse(passwordValidator.isValid(value: "weak"))
        XCTAssertFalse(passwordValidator.isValid(value: "strong_password123."))
        XCTAssertFalse(passwordValidator.isValid(value: "alk;smdklasmdkla"))
        XCTAssertFalse(passwordValidator.isValid(value: "qweoiqowepiqopwieopqwieopqwi"))
        XCTAssertFalse(passwordValidator.isValid(value: "qqqqqqqqqqqqqqqqqqQ"))
        XCTAssertFalse(passwordValidator.isValid(value: "strongpass1?"))
    }
    
    func testValidEmailValidator() {
        XCTAssertTrue(emailValidator.isValid(value: "example@example.com"))
        XCTAssertTrue(emailValidator.isValid(value: "user@email.co.uk"))
        XCTAssertTrue(emailValidator.isValid(value: "test123@example-domain.com"))
        XCTAssertTrue(emailValidator.isValid(value: "test@.domain.com"))
    }
    func testInvalidEmailValidator() {
        XCTAssertFalse(emailValidator.isValid(value: nil))
        XCTAssertFalse(emailValidator.isValid(value: "example@example"))
        XCTAssertFalse(emailValidator.isValid(value: "user@.com"))
        XCTAssertFalse(emailValidator.isValid(value: "test@domain"))
    }
    
    func testValidUsernameValidator() {
        XCTAssertTrue(usernameValidator.isValid(value: "user123"))
        XCTAssertTrue(usernameValidator.isValid(value: "123user"))
        XCTAssertTrue(usernameValidator.isValid(value: "___123user"))
        XCTAssertTrue(usernameValidator.isValid(value: "user1234567890_"))
    }
    func testInvalidUsernameValidator() {
        XCTAssertFalse(usernameValidator.isValid(value: nil))
        XCTAssertFalse(usernameValidator.isValid(value: "user@name"))
        XCTAssertFalse(usernameValidator.isValid(value: "user$%#"))
        XCTAssertFalse(usernameValidator.isValid(value: "user name"))
        XCTAssertFalse(usernameValidator.isValid(value: "user.name"))
    }
}
