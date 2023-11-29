//
//  LoginViewModelTests.swift
//  NoteAppTests
//
//  Created by Neela Rai on 29/11/2023.
//

import XCTest
@testable import NoteApp

class LoginViewModelTests: XCTestCase {

    var viewModel: LoginViewModel!

    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testLoginSuccess() {
        // Given
        let expectation = XCTestExpectation(description: "Login Success")
        let testUsername = "mike_"
        let testPassword = "20Mike"

        // When
        viewModel.login(username: testUsername, password: testPassword)

        // Then
        XCTAssertEqual(viewModel.isLoggedIn, true)

        // Fulfill the expectation asynchronously
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 1.0)
    }

    func testLoginFailure() {
        // Given
        let expectation = XCTestExpectation(description: "Login Failure")
        let testUsername = "nikita"
        let testPassword = "wrongPassword"

        // When
        viewModel.login(username: testUsername, password: testPassword)

        // Then
        XCTAssertEqual(viewModel.isLoggedIn, false)

        // Fulfill the expectation asynchronously
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 1.0)
    }

    // Add more test cases as needed
}
