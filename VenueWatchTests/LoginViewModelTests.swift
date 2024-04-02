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
    var loginTypeChangeClosureCalled = false
    var changedLoginType: LoginType?
    var titleChangeClosureCalled = false
    var changedTitle: LoginType?

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
    
    // Тестирование вызова замыкания при изменении типа логина
    func testLoginTypeChangeClosure() {
        viewModel.loginTypeChanged = { loginType in
            self.loginTypeChangeClosureCalled = true
            self.changedLoginType = loginType
        }
        
        viewModel.toggleCurrentLoginType()
        
        XCTAssertTrue(loginTypeChangeClosureCalled)
        XCTAssertEqual(changedLoginType, .signUp)
    }

    // Тестирование корректной инициализации модели
    func testModelInitialization() {
        let initialTitle = "Initial Title"
        viewModel = LoginViewModel(title: initialTitle, currentLoginType: .signUp)
        
        XCTAssertEqual(viewModel.title, initialTitle)
        XCTAssertEqual(viewModel.currentLoginType, .signUp)
        XCTAssertNil(viewModel.navigationDelegate)
    }

    // Тестирование переключения типа логина
    func testToggleLoginType() {
        XCTAssertEqual(viewModel.currentLoginType, .signIn)
        viewModel.toggleCurrentLoginType()
        XCTAssertEqual(viewModel.currentLoginType, .signUp)
        viewModel.toggleCurrentLoginType()
        XCTAssertEqual(viewModel.currentLoginType, .signIn)
    }

}
