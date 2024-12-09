//
//  SwiftFoodUITests.swift
//  SwiftFoodUITests
//
//  Created by Matthew Caballero on 12/7/24.
//

import XCTest

final class SwiftFoodUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    // My tests
    @MainActor
        func testAddItem() throws {
            let app = XCUIApplication()
            app.launch()
            
            // For now, launch goes straight to my ingredient list.
            // Might have to navigate to this screen using button presses in future.
            let toIngredientsButton = app.buttons["ToIngredients"]
            toIngredientsButton.tap()
            
            // Access fields using accessibility identifiers, tap -> type
            let ingredientTitleField = app.textFields["Title"]
            ingredientTitleField.tap()
            ingredientTitleField.typeText("Flour")
            
            let amountField = app.textFields["Amount"]
            amountField.tap()
            amountField.typeText("2")

            let unitField = app.textFields["Unit"]
            unitField.tap()
            unitField.typeText("Cups")

            // Access button w/ accessibility identifier
            // Assert the button exists
            let addButton = app.buttons["AddButton"]
            XCTAssertTrue(addButton.exists, "The 'Add Ingredient' button should exist.")
            addButton.tap()
            
            // Verify the new item is displayed
            XCTAssertTrue(app.staticTexts["Flour"].exists, "The new item should be displayed in the list.")
        }
}
