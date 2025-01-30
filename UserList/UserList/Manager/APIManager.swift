//
//  APIManager.swift
//  UserList
//
//  Created by Sedat on 30.01.2025.
//

import Foundation

// API işlemlerinin sonuçlarını iletmek için yazdığım protokol.
// weak referans kullanarak retain cycle oluşmasını engelledim.
protocol APIManagerDelegate: AnyObject {
    func didFetchUsers(_ users: [User]?)
}

// API isteklerini yönetmek için oluşturduğum sınıf. Singleton pattern kullandım
// çünkü uygulama genelinde tek bir API yöneticisi olmasını istedim.
class APIManager {
    static let shared = APIManager()
    weak var delegate: APIManagerDelegate?
    
    // Kullanıcı verilerini çekmek için yazdığım fonksiyon.
    // Delegate pattern kullanarak, veri çekme işlemi tamamlandığında
    // ilgili sınıfları haberdar ediyorum.
    func fetchUsers() {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.didFetchUsers(users)
                    }
                } catch {
                    print("Decoding error:", error)
                    DispatchQueue.main.async {
                        self.delegate?.didFetchUsers(nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.delegate?.didFetchUsers(nil)
                }
            }
        }.resume()
    }
}
