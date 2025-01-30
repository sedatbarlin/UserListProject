//
//  APIManagerTests.swift
//  UserListTests
//
//  Created by Sedat on 30.01.2025.
//

import XCTest
@testable import UserList

final class APIManagerTests: XCTestCase {

    func testFetchUsers() throws {
        let expectation = XCTestExpectation(description: "Fetch users from API")
        
        APIManager.shared.fetchUsers { users in
            XCTAssertNotNil(users, "Users should not be nil.")
            XCTAssertGreaterThan(users?.count ?? 0, 0, "User count should be greater than zero.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
