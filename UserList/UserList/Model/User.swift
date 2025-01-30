//
//  User.swift
//  UserList
//
//  Created by Sedat on 30.01.2025.
//

import Foundation

// API'den gelen kullanıcı verilerini modellemek için oluşturduğum struct
// Decodable protokolünü kullanarak JSON parse işlemini kolaylaştırdım
struct User: Decodable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let website: String
}
