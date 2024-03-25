//
//  BaseViewControllerTests.swift
//  VenueWatchTests
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import XCTest
@testable import VenueWatch

final class BaseViewControllerTests: XCTestCase {
    
    var viewController: BaseViewController<TestViewModel>!
    
    override func setUp() {
        super.setUp()
        let viewModel = TestViewModel()
        viewController = BaseViewController(viewModel: viewModel)
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testNavigationTitle() {
        let expectedTitle = "Test Title"
        viewController.viewModel.title = expectedTitle
        viewController.configureViews()
        XCTAssertEqual(viewController.navigationItem.title, expectedTitle)
    }
    
    func testAddNavBarButton() {
        let expectedTitle = "Button Title"
        viewController.addNavBarButton(
            at: .right,
            with: expectedTitle,
            image: nil,
            selector: #selector(dummySelector)
        )
        guard let navButton = viewController.navigationItem.rightBarButtonItem?.customView as? UIButton
        else {
            XCTFail("Failed to add nav button")
            return
        }
        XCTAssertEqual(navButton.titleLabel?.text, expectedTitle)
    }
    @objc func dummySelector() { }
}

// Тестовая ViewModel для использования в тестах
class TestViewModel: IBaseViewModel {
    var title: String?
    var presentHandler: ((UIViewController, Bool) -> Void)?
}
