//
//  LoginViewUITests.swift
//  NoteAppUITests
//
//  Created by Devasis KC on 30/11/2023.
//

import XCTest

class LoginViewUITests: XCTestCase {
    
    // Provide your app's launch configuration
    override func setUpWithError() throws {
        continueAfterFailure = false
        // Your app launch code goes here
    }
    
    func testLoginSuccess() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Interact with username and password text fields
        let usernameTextField = app.textFields["Username"]
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        usernameTextField.typeText("testuser")
        
        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText("testpassword")
        
        // Interact with the login button
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
        // Verify that the login was successful (adjust based on your actual success criteria)
        XCTAssertTrue(app.otherElements["Welcome to your Notes"].exists)
    }
    
    func testLoginFailure() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Interact with the login button without entering credentials
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
        // Verify that the error message is displayed (adjust based on your actual error message)
        XCTAssertTrue(app.staticTexts["Please enter both username and password."].exists)
    }
}
