//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Peter Vanhoef on 19/03/17.
//  Copyright © 2017 Peter Vanhoef. All rights reserved.
//

import XCTest

class CalculatorUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTask1() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        
        let buttonDigit1 = app.buttons["1"]
        let buttonDigit2 = app.buttons["2"]
        let buttonDigit3 = app.buttons["3"]
        let buttonDigit4 = app.buttons["4"]
        let buttonDigit5 = app.buttons["5"]
        let buttonDigit6 = app.buttons["6"]
        let buttonDigit7 = app.buttons["7"]
        let buttonDigit8 = app.buttons["8"]
        let buttonDigit9 = app.buttons["9"]
        let buttonDigit0 = app.buttons["0"]
        
        let buttonDecimalPoint = app.buttons["."]

        let buttonPi = app.buttons["π"]
        
        let buttonMultiply = app.buttons["×"]
        let buttonDivide = app.buttons["÷"]
        let buttonAdd = app.buttons["+"]
        let buttonSubtract = app.buttons["−"]
        let buttonCos = app.buttons["cos"]
        let buttonSqrt = app.buttons["√"]

        let buttonEqual = app.buttons["="]
        
        // cos(π) = -1
        buttonPi.tap()
        buttonCos.tap()
        XCTAssert(app.staticTexts["-1.0"].exists)
        
        // 12 × 4 = 48
        buttonDigit1.tap()
        buttonDigit2.tap()
        buttonMultiply.tap()
        buttonDigit4.tap()
        buttonEqual.tap()
        XCTAssert(app.staticTexts["48.0"].exists)
        
        // 568 + 78 = 646
        buttonDigit5.tap()
        buttonDigit6.tap()
        buttonDigit8.tap()
        buttonAdd.tap()
        buttonDigit7.tap()
        buttonDigit8.tap()
        buttonEqual.tap()
        XCTAssert(app.staticTexts["646.0"].exists)

        // 45 ÷ 5 = 9
        buttonDigit4.tap()
        buttonDigit5.tap()
        buttonDivide.tap()
        buttonDigit5.tap()
        buttonEqual.tap()
        XCTAssert(app.staticTexts["9.0"].exists)
        
        // 23 ± = -23
        buttonDigit2.tap()
        buttonDigit3.tap()
        app.buttons["±"].tap()
        XCTAssert(app.staticTexts["-23.0"].exists)
        
        // 92736 - 123 = 92613
        buttonDigit9.tap()
        buttonDigit2.tap()
        buttonDigit7.tap()
        buttonDigit3.tap()
        buttonDigit6.tap()
        buttonSubtract.tap()
        buttonDigit1.tap()
        buttonDigit2.tap()
        buttonDigit3.tap()
        buttonEqual.tap()
        XCTAssert(app.staticTexts["92613.0"].exists)
        
        // 8 × 0.5 = 4
        buttonDigit8.tap()
        buttonMultiply.tap()
        buttonDigit0.tap()
        buttonDecimalPoint.tap()
        buttonDigit5.tap()
        buttonEqual.tap()
        XCTAssert(app.staticTexts["4.0"].exists)
        
        // √(√(9)) = 3
        buttonDigit8.tap()
        buttonDigit1.tap()
        buttonSqrt.tap()
        XCTAssert(app.staticTexts["9.0"].exists)
        buttonSqrt.tap()
        XCTAssert(app.staticTexts["3.0"].exists)
        
    }
    
    func testTask2() {
        let app = XCUIApplication()
        
        let buttonDigit1 = app.buttons["1"]
        let buttonDigit2 = app.buttons["2"]
        let buttonDigit3 = app.buttons["3"]
        let buttonDigit4 = app.buttons["4"]
        let buttonDigit5 = app.buttons["5"]
        let buttonDigit7 = app.buttons["7"]
        let buttonDigit9 = app.buttons["9"]
        
        let buttonDecimalPoint = app.buttons["."]
        
        let buttonAdd = app.buttons["+"]
        let buttonSubtract = app.buttons["−"]
        
        let buttonEqual = app.buttons["="]
        
        // Allow decimal point
        buttonDigit4.tap()
        XCTAssert(app.staticTexts["4"].exists)
        buttonDigit2.tap()
        XCTAssert(app.staticTexts["42"].exists)
        buttonDecimalPoint.tap()
        XCTAssert(app.staticTexts["42."].exists)
        buttonDigit3.tap()
        XCTAssert(app.staticTexts["42.3"].exists)
        buttonDigit9.tap()
        XCTAssert(app.staticTexts["42.39"].exists)
        buttonSubtract.tap()
        XCTAssert(app.staticTexts["42.39"].exists)
        buttonDigit7.tap()
        XCTAssert(app.staticTexts["7"].exists)
        buttonDecimalPoint.tap()
        XCTAssert(app.staticTexts["7."].exists)
        buttonDigit1.tap()
        XCTAssert(app.staticTexts["7.1"].exists)
        buttonDigit5.tap()
        XCTAssert(app.staticTexts["7.15"].exists)
        buttonEqual.tap()
        XCTAssert(app.staticTexts["35.24"].exists)
        
        // And only allow 1 decimal point
        buttonDigit4.tap()
        XCTAssert(app.staticTexts["4"].exists)
        buttonDigit2.tap()
        XCTAssert(app.staticTexts["42"].exists)
        buttonDecimalPoint.tap()
        XCTAssert(app.staticTexts["42."].exists)
        buttonDecimalPoint.tap()
        XCTAssert(app.staticTexts["42."].exists)
        buttonDigit3.tap()
        XCTAssert(app.staticTexts["42.3"].exists)
        buttonDecimalPoint.tap()
        XCTAssert(app.staticTexts["42.3"].exists)
        buttonDigit9.tap()
        XCTAssert(app.staticTexts["42.39"].exists)
        buttonSubtract.tap()
        XCTAssert(app.staticTexts["42.39"].exists)
        buttonDigit7.tap()
        XCTAssert(app.staticTexts["7"].exists)
        buttonDecimalPoint.tap()
        XCTAssert(app.staticTexts["7."].exists)
        buttonDecimalPoint.tap()
        XCTAssert(app.staticTexts["7."].exists)
        buttonDigit1.tap()
        XCTAssert(app.staticTexts["7.1"].exists)
        buttonDecimalPoint.tap()
        XCTAssert(app.staticTexts["7.1"].exists)
        buttonDigit5.tap()
        XCTAssert(app.staticTexts["7.15"].exists)
        buttonEqual.tap()
        XCTAssert(app.staticTexts["35.24"].exists)
        
        // User starts off entering a new number by touching the decimal point
        buttonDecimalPoint.tap()
        XCTAssert(app.staticTexts["0."].exists)
        buttonDigit2.tap()
        XCTAssert(app.staticTexts["0.2"].exists)
        buttonDigit7.tap()
        XCTAssert(app.staticTexts["0.27"].exists)
        buttonAdd.tap()
        buttonDigit3.tap()
        XCTAssert(app.staticTexts["3"].exists)
        buttonEqual.tap()
        XCTAssert(app.staticTexts["3.27"].exists)
    }
    
    func testAdditionalOperationsTask3() {
        let app = XCUIApplication()
        
        app.buttons["0"].tap()
        app.buttons["sin"].tap()
        XCTAssert(app.staticTexts["0.0"].exists)
        
        app.buttons["0"].tap()
        app.buttons["tan"].tap()
        XCTAssert(app.staticTexts["0.0"].exists)
        
        app.buttons["1"].tap()
        app.buttons["8"].tap()
        app.buttons["x²"].tap()
        XCTAssert(app.staticTexts["324.0"].exists)
        
        app.buttons["4"].tap()
        app.buttons["x⁻¹"].tap()
        XCTAssert(app.staticTexts["0.25"].exists)
    }

}
