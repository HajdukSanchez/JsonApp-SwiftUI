//
//  HomeView.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 16/08/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            Text("Welcome")
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
    HomeView()
}
