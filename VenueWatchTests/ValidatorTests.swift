//
//  ValidatorTests.swift
//  VenueWatchTests
//
//  Created by Дмитрий Корчагин on 3/21/24.
//

import XCTest
@testable import VenueWatch

final class ValidatorTests: XCTestCase {
    typealias Validator = Utilities.Validator
    
    func testValidEmail() throws {
        XCTAssertTrue(Validator.isValid("example@example.com", .email()))
        XCTAssertTrue(Validator.isValid("user123@mail.domain", .email()))
        XCTAssertTrue(Validator.isValid("user.name@example.co.uk", .email()))
        XCTAssertTrue(Validator.isValid("user+name@example.org", .email()))
        XCTAssertTrue(Validator.isValid("user123@example.com", .email()))
    }
    
    func testInvalidEmail() throws {
        XCTAssertFalse(Validator.isValid("", .email()))
        XCTAssertFalse(Validator.isValid("example.com", .email()))
        XCTAssertFalse(Validator.isValid("invalid_email_format", .email()))
        XCTAssertFalse(Validator.isValid("not_an_email", .email()))
        XCTAssertFalse(Validator.isValid("user@example", .email()))
    }
    
    func testValidUsername() throws {
        XCTAssertTrue(Validator.isValid("Username123", .username()))
        XCTAssertTrue(Validator.isValid("user_name", .username()))
        XCTAssertTrue(Validator.isValid("user1234", .username()))
        XCTAssertTrue(Validator.isValid("123user", .username()))
        XCTAssertTrue(Validator.isValid("user_123", .username()))
    }
    
    func testInvalidUsername() throws {
        XCTAssertFalse(Validator.isValid("", .username()))
        XCTAssertFalse(Validator.isValid("us", .username()))
        XCTAssertFalse(Validator.isValid("!@#$%", .username()))
        XCTAssertFalse(Validator.isValid("user name", .username()))
        XCTAssertFalse(Validator.isValid("user-name", .username()))
    }
    
    func testValidPassword() throws {
        XCTAssertTrue(Validator.isValid("StrongPassword123!", .password()))
        XCTAssertTrue(Validator.isValid("SecurePass123$", .password()))
        XCTAssertTrue(Validator.isValid("ComplexPassword$123", .password()))
        XCTAssertTrue(Validator.isValid("Pa$$w0rd123", .password()))
        XCTAssertTrue(Validator.isValid("Passw0rd!", .password()))
    }
    
    func testInvalidPassword() throws {
        XCTAssertFalse(Validator.isValid("weak", .password()))
        XCTAssertFalse(Validator.isValid("weakpassword", .password()))
        XCTAssertFalse(Validator.isValid("", .password()))
        XCTAssertFalse(Validator.isValid("password123", .password()))
        XCTAssertFalse(Validator.isValid("password", .password()))
    }
}

