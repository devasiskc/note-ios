//
//  LoginViewUITests.swift
//  NoteAppUITests
//
//  Created by Devasis KC on 30/11/2023.
//

import XCTest

class LoginViewUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Launch the app in the test environment
        app = XCUIApplication()
        app.launch()
    }

    func testLoginSuccess() throws {
        // Access the username and password text fields using accessibility identifiers
        let usernameTextField = app.textFields["Username"]
        let passwordTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        
        // Enter valid credentials
        usernameTextField.tap()
        usernameTextField.typeText("test")
        
        passwordTextField.tap()
        passwordTextField.typeText("test2@")
        
        // Tap the login button
        loginButton.tap()
        
    }

    func testLoginFailure() throws {
        // Access the login button using accessibility identifier
        let loginButton = app.buttons["Login"]
        
        // Tap the login button without entering credentials
        loginButton.tap()
        
        // Check if the error message label exists to verify login failure
        XCTAssertTrue(app.staticTexts["Please enter both username and password."].exists)
    }
}
