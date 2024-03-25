//
//  LoginViewModelTests.swift
//  VenueWatchTests
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import XCTest
@testable import VenueWatch

class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel(title: "Login", currentLoginType: .signIn)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testTitle() {
        XCTAssertEqual(viewModel.title, "Login", "ViewModel title should be 'Login'")
        XCTAssertNotEqual(viewModel.title, "Profile", "ViewModel title should be 'Login'")
    }
    
    func testToggleCurrentLoginType() {
        XCTAssertEqual(viewModel.currentLoginType, .signIn)
        viewModel.toggleCurrentLoginType()
        XCTAssertEqual(viewModel.currentLoginType, .signUp)
        viewModel.toggleCurrentLoginType()
        XCTAssertEqual(viewModel.currentLoginType, .signIn)
    }
    
    func testTextFieldShouldReturn() {
        let viewModel = LoginViewModel(title: "Test Title", currentLoginType: .signIn)
        
        let textField = UITextField()
        viewModel.textFieldShouldReturn(textField)
        
        XCTAssertFalse(textField.isFirstResponder)
    }
    
    func testPresentHandler() {
        var presentCalled = false
        let viewModel = LoginViewModel(title: "Test Title", currentLoginType: .signIn)
        viewModel.presentHandler = { _, _ in
            presentCalled = true
        }
        
        viewModel.presentHandler?(UIViewController(), true)
        
        XCTAssertTrue(presentCalled)
    }
    
    func testInitializer() {
        let title = "Test Title"
        let currentLoginType: LoginType = .signIn
        
        let viewModel = LoginViewModel(title: title, currentLoginType: currentLoginType)
        
        XCTAssertEqual(viewModel.title, title)
        XCTAssertEqual(viewModel.currentLoginType, currentLoginType)
    }
    
    func testDefaultInitializer() {
        let viewModel = LoginViewModel(currentLoginType: .signIn)
        
        XCTAssertNil(viewModel.title)
        XCTAssertEqual(viewModel.currentLoginType, .signIn)
    }
}
