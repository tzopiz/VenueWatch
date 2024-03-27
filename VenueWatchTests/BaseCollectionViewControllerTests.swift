//
//  BaseCollectionViewControllerTests.swift
//  VenueWatchTests
//
//  Created by Дмитрий Корчагин on 3/27/24.
//

import XCTest
@testable import VenueWatch

class BaseCollectionViewControllerTests: XCTestCase {
    var viewController: BaseCollectionViewController<TestCollectionViewModel, TestCell>!

    override func setUp() {
        super.setUp()
        let viewModel = TestCollectionViewModel(items: ["Item 1", "Item 2", "Item 3"])
        let layout = UICollectionViewFlowLayout()
        viewController = BaseCollectionViewController(viewModel: viewModel, layout: layout)
        _ = viewController.view // Force load view
    }

    override func tearDown() {
        viewController = nil
        super.tearDown()
    }

    // Тестирование инициализации модели и контроллера
    func testInitialization() {
        XCTAssertNotNil(viewController.viewModel)
        XCTAssertNotNil(viewController.collectionView)
        XCTAssertNotNil(viewController.collectionView.dataSource)
        XCTAssertNotNil(viewController.collectionView.delegate)
    }

    // Тестирование отображения элементов в коллекции
    func testItemsCount() {
        XCTAssertEqual(viewController.collectionView(viewController.collectionView, numberOfItemsInSection: 3), 3)
    }

    // Тестирование конфигурации внешнего вида
    func testConfigureViews() {
        XCTAssertEqual(viewController.view.backgroundColor, App.Color.secondarySystemBackground)
        // Другие проверки внешнего вида
    }

    // Дополнительный тест: проверка размера ячейки
    func testCellSize() {
        let indexPath = IndexPath(item: 0, section: 0)
        let expectedSize = CGSize(width: viewController.collectionView.frame.width, height: 50)
        let actualSize = viewController.collectionView(viewController.collectionView, layout: viewController.collectionView.collectionViewLayout, sizeForItemAt: indexPath)
        XCTAssertEqual(actualSize, expectedSize)
    }
}

// Пример заглушки для ячейки
class TestCell: UICollectionViewCell {}

// Пример заглушки для ViewModel
class TestCollectionViewModel: ICollectionViewModel {
    var title: String?
    var items: [String]
    var navigationDelegate: ViewModelNavigationDelegate?
    
    init(title: String? = nil, items: [String]) {
        self.title = title
        self.items = items
    }

    func item(for indexPath: IndexPath) -> String {
        return items[indexPath.row]
    }
}

// Пример заглушки для делегата коллекции
class MockCollectionDelegate: NSObject, UICollectionViewDelegate {
    var itemSelected = false
    var selectedIndexPath: IndexPath?

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemSelected = true
        selectedIndexPath = indexPath
    }
}

