//
//  UserTests.swift
//  UserListTests
//
//  Created by Sedat on 30.01.2025.
//

import XCTest
@testable import UserList

final class UserTests: XCTestCase {

    func testUserDecoding() throws {
        let json = """
        {
            "id": 1,
            "name": "Leanne Graham",
            "email": "Sincere@april.biz",
            "phone": "1-770-736-8031 x56442",
            "website": "hildegard.org"
        }
        """.data(using: .utf8)!
        
        let user = try JSONDecoder().decode(User.self, from: json)
        
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.name, "Leanne Graham")
        XCTAssertEqual(user.email, "Sincere@april.biz")
        XCTAssertEqual(user.phone, "1-770-736-8031 x56442")
        XCTAssertEqual(user.website, "hildegard.org")
    }
}
