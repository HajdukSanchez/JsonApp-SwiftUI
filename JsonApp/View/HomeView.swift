//
//  HomeView.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 16/08/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var usersViewModel: UsersViewModel
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if usersViewModel.users.isEmpty {
                    ProgressView()
                } else {
                    List(usersViewModel.users, id: \.id) { item in
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .bold()
                            Text(item.email)
                        }
                    }
                }
            }
            .navigationBarTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        authViewModel.logOut()
                    } label: {
                        Text("Exit")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // TODO: add action
                    } label: {
                        Text("Next")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(usersViewModel: UsersViewModel.test)
}
