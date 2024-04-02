//
//  CollectionViewUITests.swift
//  VenueWatchUITests
//
//  Created by Дмитрий Корчагин on 3/27/24.
//

import XCTest

final class CollectionViewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    // UITest наличия коллекции на экране
    func testCollectionViewExists() throws {
        XCTAssertTrue(app.collectionViews["collectionView"].exists)
    }

    // UITest проверки отображения элементов в коллекции
    func testCollectionItemsVisibility() throws {
        let collectionView = app.collectionViews["collectionView"]
        let firstCell = collectionView.cells.element(boundBy: 0)
        let secondCell = collectionView.cells.element(boundBy: 1)

        XCTAssertTrue(firstCell.exists)
        XCTAssertTrue(secondCell.exists)
    }

    // UITest проверки навигации
    func testNavigationFromCollectionView() throws {
        let collectionView = app.collectionViews["collectionView"]
        let firstCell = collectionView.cells.element(boundBy: 0)
        firstCell.tap()

        XCTAssertTrue(app.navigationBars["Detail Screen"].exists)
    }

    // UITest проверки взаимодействия с ячейками
    func testInteractionWithCells() throws {
        let collectionView = app.collectionViews["collectionView"]
        let firstCell = collectionView.cells.element(boundBy: 0)
        firstCell.tap()

        let backButton = app.navigationBars.buttons["Back"]
        XCTAssertTrue(backButton.exists)
        backButton.tap()

        XCTAssertTrue(collectionView.exists)
    }

    // UITest проверки скроллинга
    func testCollectionViewScrolling() throws {
        let collectionView = app.collectionViews["collectionView"]
        let startCell = collectionView.cells.element(boundBy: 0)
        let endCell = collectionView.cells.element(boundBy: 10)

        collectionView.swipeUp()
        XCTAssertTrue(endCell.exists)

        collectionView.swipeDown()
        XCTAssertTrue(startCell.exists)
    }
}
