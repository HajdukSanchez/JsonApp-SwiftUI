//
//  ContentView.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 13/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        Group {
            if !authViewModel.error {
                if authViewModel.authenticated {
                    HomeView(usersViewModel: UsersViewModel.shared)
                } else {
                    LoginView()
                }
            } else {
                VStack {
                    Text("Authentication invalid")
                    Button {
                        authViewModel.authenticated = false
                        authViewModel.error = false
                    } label: {
                        Text("Logout")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
