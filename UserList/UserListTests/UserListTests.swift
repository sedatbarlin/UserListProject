//
//  UserListTests.swift
//  UserListTests
//
//  Created by Sedat on 30.01.2025.
//

import XCTest
@testable import UserList

final class UserListTests: XCTestCase {

    var viewModel: UsersViewModel!

    override func setUpWithError() throws {
        viewModel = UsersViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testInitialUserCount() throws {
        XCTAssertEqual(viewModel.numberOfUsers, 0, "Initial user count should be zero.")
    }

    func testFetchUsers() throws {
        let expectation = XCTestExpectation(description: "Fetch users")
        
        viewModel.fetchUsers()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertGreaterThan(self.viewModel.numberOfUsers, 0, "User count should be greater than zero after fetching.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    func testGetUser() throws {
        let expectation = XCTestExpectation(description: "Fetch users")
        
        viewModel.fetchUsers()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let user = self.viewModel.getUser(at: 0)
            XCTAssertNotNil(user, "User should not be nil.")
            XCTAssertEqual(user.name, "Leanne Graham", "User name should match the expected value.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
