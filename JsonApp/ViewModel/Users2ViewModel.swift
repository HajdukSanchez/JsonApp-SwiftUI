//
//  Users2ViewModel.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 20/08/24.
//

import Foundation

struct ListUser2 : Decodable {
    var data: [User2]
}

class Users2ViewModel: ObservableObject {
    @Published var users: ListUser2 = ListUser2(data: [])
    
    // MARK: - Statics
    static let shared: Users2ViewModel = .init()
    static let test: Users2ViewModel = {
        let viewModel = Users2ViewModel(isTest: true)
        var usersData = [User2]()
        for i in 1...10 {
            usersData.append(User2(
                id: i,
                first_name: "User \(i)",
                email: "user\(i)@example.com",
                avatar: "https://randomuser.me/api/portraits/men/\(i).jpg"
            ))
        }
        viewModel.users = ListUser2(data: usersData)
        return viewModel
    }()

    
    init(isTest: Bool = false) {
        if !isTest {
            fetchUsers()
        }
    }
    
    func fetchUsers() {
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let newData = data else { return }
            
            do {
                let response = try JSONDecoder().decode(ListUser2.self, from: newData)
                DispatchQueue.main.async {
                    self.users = response
                }
            } catch let error as NSError {
                print("Error getting users", error.localizedDescription)
            }
        }.resume()
    }
}
