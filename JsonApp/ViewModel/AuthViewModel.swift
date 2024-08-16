//
//  AuthViewModel.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 13/08/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var authenticated = false
    @Published var error = false
    
    func login(email: String, password: String) {
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        let parameters = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                let newData = try JSONDecoder().decode(Auth.self, from: data)
                if !newData.token.isEmpty {
                    DispatchQueue.main.async {
                        self.authenticated = true
                        self.error = false
                    }
                }
            } catch let error as NSError {
                print("Error", error.localizedDescription)
                DispatchQueue.main.async {
                    self.authenticated = false
                    self.error = true
                }
            }
        }.resume()
    }
}
