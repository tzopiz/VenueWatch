//
//  ValidatorTests.swift
//  VenueWatchTests
//
//  Created by Дмитрий Корчагин on 3/21/24.
//

import XCTest
@testable import VenueWatch

final class ValidatorTests: XCTestCase {
    typealias ValidatorType = Utilities.Validators.ValidatorType
    typealias Validators = Utilities.Validators

    private var validPasswords: Array<String?> {
        ["StrongPassword123?",
         "SecurePwd456@",
         "MyPass123!",
         "StrongPwd!2022",
         "SafePassword99%",
         "Pycbum-5kaqcu-vycbiw"]
    }
    private var invalidPasswords: Array<String?> {
        [nil,
         "weak",
         "strong_password123.",
         "alk;smdklasmdkla",
         "qweoiqowepiqopwieopqwieopqwi",
         "qqqqqqqqqqqqqqqqqqQ",
         "strongpass1?"]
    }
    private var validEmails: Array<String?> {
        ["example@example.com",
         "user@email.co.uk",
         "test123@example-domain.com",
         "test@.domain.com"]
    }
    private var invalidEmails: Array<String?> {
        [nil,
         "example@example",
         "user@.com",
         "test@domain",
         "@gmail.com",
         "tzopiz@gmail.com@"]
    }
    private var validUsernames: Array<String?> {
        ["user123",
         "123user",
         "___123user",
         "user1234567890_"]
    }
    private var invalidUsernames: Array<String?> {
        [nil,
         "user@name",
         "user$%#",
         "user name",
         "user.name",
         " username"]
    }
    func testValidPasswordValidator() {
        let type: ValidatorType = .password()
        for validPassword in validPasswords {
            switch Validators.isValid(validPassword, type: type) {
            case .invalid(let error):
                XCTFail(
                    failMessage(forValid: validPassword, withError: error, type: type)
                )
            case .valid(_): break
            }
        }
    }
    func testInvalidPasswordValidator() {
        let type: ValidatorType = .password()
        for invalidPassword in invalidPasswords {
            switch Validators.isValid(invalidPassword, type: type) {
            case .valid(let str):
                XCTFail(
                    failMessage(forInvalid: str, type: type)
                )
            case .invalid(_): break
            }
        }
    }
    
    func testValidEmailValidator() {
        let type: ValidatorType = .email()
        for validEmail in validEmails {
            switch Validators.isValid(validEmail, type: type) {
            case .invalid(let error):
                XCTFail(
                    failMessage(forValid: validEmail, withError: error, type: type)
                )
            case .valid(_): break
            }
        }
    }
    func testInvalidEmailValidator() {
        let type: ValidatorType = .email()
        for invalidEmail in invalidEmails {
            switch Validators.isValid(invalidEmail, type: type) {
            case .valid(let str):
                XCTFail(
                    failMessage(forInvalid: str, type: type)
                )
            case .invalid(_): break
            }
        }
    }
    
    func testValidUsernameValidator() {
        let type: ValidatorType = .username()
        for validUsername in validUsernames {
            switch Validators.isValid(validUsername, type: type) {
            case .invalid(let error):
                XCTFail(
                    failMessage(forValid: validUsername, withError: error, type: type)
                )
            case .valid(_): break
            }
        }
    }
    func testInvalidUsernameValidator() {
        let type: ValidatorType = .username()
        for invalidUsername in invalidUsernames {
            switch Validators.isValid(invalidUsername, type: type) {
            case .valid(let str):
                XCTFail(
                    failMessage(forInvalid: str, type: type)
                )
            case .invalid(_): break
            }
        }
    }
}

extension ValidatorTests {
    func failMessage(
        forValid validstr: String?,
        withError error: String,
        type: ValidatorType
    ) -> String {
        return
                """
                \n==== FAILED ====
                \(getType(of: type)) \(String(describing: validstr)) is unexpectedly invalid with error: \(error)"
                ================
                """
    }
    func failMessage(
        forInvalid invalidstr: String?,
        type: ValidatorType
    ) -> String {
        return
            """
            \n==== FAILED ====
            \(getType(of: type)) \(String(describing: invalidstr)) is unexpectedly valid
            ================
            """
    }
    func getType(of type: ValidatorType) -> String {
        switch type {
        case .email(let value),
                .password(let value),
                .username(let value): return value
        }
    }
}
