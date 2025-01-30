//
//  UserViewModel.swift
//  UserList
//
//  Created by Sedat on 30.01.2025.
//

import Foundation

// ViewModel'deki değişiklikleri View katmanına iletmek için yazdığım protokol
protocol UsersViewModelDelegate: AnyObject {
    func didUpdateUsers()
}

// MVVM mimarisindeki ViewModel katmanı.
// API'den gelen verileri işleyip View katmanına iletmek için kullanıyorum.
class UsersViewModel: APIManagerDelegate {
    
    private var users: [User] = []
    weak var delegate: UsersViewModelDelegate?
    
    // View katmanına sadece ihtiyacı olan metodları sunuyorum,
    // böylece loose coupling sağlıyorum.
    var numberOfUsers: Int {
        return users.count
    }

    func getUser(at index: Int) -> User {
        return users[index]
    }

    func fetchUsers() {
        APIManager.shared.delegate = self
        APIManager.shared.fetchUsers()
    }

    // API'den gelen verileri işleyip View'a haber veriyorum
    func didFetchUsers(_ users: [User]?) {
        self.users = users ?? []
        delegate?.didUpdateUsers()
    }
}
