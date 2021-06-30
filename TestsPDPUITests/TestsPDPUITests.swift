//
//  TestsPDPUITests.swift
//  TestsPDPUITests
//
//  Created by Никита Лужбин on 16.06.2021.
//

import XCTest

class TestsPDPUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogInButtonEnabled() throws {
        let app = XCUIApplication()
        app.launch()

        let login = "qwerty"
        let password = "!Qwerty_"
        let shouldLoginButtonBeEnabled = true

        let loginTextField = app.textFields["loginTextField"]

        loginTextField.tap()
        loginTextField.typeText(login)

        let passwordTextField = app.textFields["passwordTextField"]

        passwordTextField.tap()
        passwordTextField.typeText(password)

        let logInButton = app.buttons["loginButton"]

        XCTAssert(logInButton.isEnabled == shouldLoginButtonBeEnabled)
    }
}
