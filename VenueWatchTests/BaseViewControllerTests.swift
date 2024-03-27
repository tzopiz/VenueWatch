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
    
    // Тестирование установки заголовка
    func testSetTitle() {
        XCTAssertNotEqual(viewController.title, "Test Title")
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
    
    // Тестирование навигации с помощью делегата
    func testNavigationDelegate() {
        let mockNavigationDelegate = MockNavigationDelegate()
        viewController.viewModel.navigationDelegate = mockNavigationDelegate

        viewController.viewModel.navigationDelegate?.presentViewController(UIViewController(), animated: true)
        XCTAssertTrue(mockNavigationDelegate.presentViewControllerCalled)

        viewController.viewModel.navigationDelegate?.pushViewController(UIViewController(), animated: true)
        XCTAssertTrue(mockNavigationDelegate.pushViewControllerCalled)

        viewController.viewModel.navigationDelegate?.dismiss(animated: true)
        XCTAssertTrue(mockNavigationDelegate.dismissCalled)
    }
}

class TestViewModel: IBaseViewModel {
    var title: String?
    var navigationDelegate: ViewModelNavigationDelegate?
    
    init(title: String? = nil) {
        self.title = title
    }
}

// Пример заглушки для ViewModelNavigationDelegate
class MockNavigationDelegate: ViewModelNavigationDelegate {
    var presentViewControllerCalled = false
    var pushViewControllerCalled = false
    var dismissCalled = false

    func presentViewController(_ viewController: UIViewController, animated: Bool) {
        presentViewControllerCalled = true
    }

    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCalled = true
    }

    func dismiss(animated: Bool) {
        dismissCalled = true
    }
}
