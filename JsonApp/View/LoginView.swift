//
//  LoginView.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 16/08/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {
                VStack(alignment: .leading) {
                    Text("Email")
                        .foregroundStyle(.white)
                        .bold()
                    TextField("Email", text: $email)
                        .background(.white)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                    Text("Password")
                        .foregroundStyle(.white)
                        .bold()
                    SecureField("Password", text: $password)
                        .background(.white)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button {
                    authViewModel.login(email: email, password: password)
                } label: {
                    Text("Login")
                        .foregroundStyle(.white)
                        .bold()
                }
                .padding(.top, 40)

            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
