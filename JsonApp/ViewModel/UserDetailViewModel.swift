//
//  UserDetailViewModel.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 20/08/24.
//

import Foundation

private struct UserDetailResponse : Decodable {
    var data: User2
}

class UserDetailViewModel: ObservableObject {
    
    @Published var user: User2?
    
    // MARK: - Statics
    static let shared: UserDetailViewModel = .init()
    static let test: UserDetailViewModel = {
        let userId = 1
        let viewModel = UserDetailViewModel()
        viewModel.user = User2(
            id: userId,
            first_name: "User \(userId)",
            email: "user\(userId)@example.com",
            avatar: "https://randomuser.me/api/portraits/men/\(userId).jpg"
        )
        return viewModel
    }()


    
    func fetchUser(with userId: Int) {
        // Reset user to nil
        user = nil
        
        // Make call
        guard let url = URL(string: "https://reqres.in/api/users/\(userId)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let newData = data else { return }
            
            do {
                let response = try JSONDecoder().decode(UserDetailResponse.self, from: newData)
                DispatchQueue.main.async {
                    self.user = response.data
                }
            } catch let error as NSError {
                print("Error getting user", error.localizedDescription)
            }
        }.resume()
    }
}
