//
//  HomeView.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 16/08/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var usersVM: UsersViewModel = UsersViewModel.shared
    @EnvironmentObject private var authVM: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if usersVM.users.isEmpty {
                    ProgressView()
                } else {
                    List(usersVM.users, id: \.id) { item in
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .bold()
                            Text(item.email)
                            Text(item.address.street)
                        }
                    }
                }
            }
            .navigationBarTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        authVM.logOut()
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
    HomeView(usersVM: UsersViewModel.test)
}
