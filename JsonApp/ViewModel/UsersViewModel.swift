//
//  UsersViewModel.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 16/08/24.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    
    // MARK: - Statics
    static let shared: UsersViewModel = .init()
    static let test: UsersViewModel = .init(isPreview: true)

    
    init(isPreview: Bool = false) {
        fetchUsers()
        
        if isPreview {
            for i in 1...10 {
                users.append(User(
                    id: i,
                    name: "User \(i)",
                    email: "user\(i)@example.com"
                ))
            }
        }
    }
    
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let newData = data else { return }
            do {
                let response = try JSONDecoder().decode([User].self, from: newData)
                DispatchQueue.main.async {
                    self.users = response
                }
            } catch let error as NSError {
                print("Error getting users", error.localizedDescription)
            }
        }.resume()
    }
}
