//
//  UserViewModelTests.swift
//  UserListTests
//
//  Created by Sedat on 30.01.2025.
//

import XCTest
@testable import UserList

final class UserViewModelTests: XCTestCase {

    var viewModel: UsersViewModel!

    override func setUpWithError() throws {
        viewModel = UsersViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchUsersUpdatesPublisher() throws {
        let expectation = XCTestExpectation(description: "Users publisher should be updated")
        
        viewModel.usersPublisher
            .sink { _ in
                XCTAssertGreaterThan(self.viewModel.numberOfUsers, 0, "User count should be greater than zero after fetching.")
                expectation.fulfill()
            }
            .store(in: &viewModel.cancellables)
        
        viewModel.fetchUsers()
        
        wait(for: [expectation], timeout: 5.0)
    }
}
