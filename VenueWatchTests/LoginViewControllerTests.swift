//
//  LoginViewControllerTests.swift
//  VenueWatchTests
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import XCTest
@testable import VenueWatch

class LoginViewControllerTests: XCTestCase {
    
    var viewController: LoginViewController!
    
    override func setUp() {
        super.setUp()
        let viewModel = LoginViewModel(currentLoginType: .signIn)
        viewController = LoginViewController(viewModel: viewModel)
        _ = viewController.view
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    func testToggleCurrentLoginType() {
        let viewModel = LoginViewModel(title: "Test Title", currentLoginType: .signIn)
        let viewController = LoginViewController(viewModel: viewModel)
        let _ = NavigationController(rootViewController: viewController)
        
        viewController.toggleButtonTapped()
        
        XCTAssertEqual(viewModel.currentLoginType, .signUp)
    }
    func testTextFieldShouldReturn() {
        let textField = UITextField()
        let shouldReturn = viewController.textFieldShouldReturn(textField)
        XCTAssertTrue(shouldReturn, "TextField should return true")
    }
    func testTextFieldShouldReturn2() {
        let viewModel = LoginViewModel(title: "Test Title", currentLoginType: .signIn)
        let viewController = LoginViewController(viewModel: viewModel)
        let textField = UITextField()
        
        let shouldReturn = viewController.textFieldShouldReturn(textField)
        
        XCTAssertTrue(shouldReturn)
    }
    // TODO: Add more test cases for other ViewController functionalities
}
