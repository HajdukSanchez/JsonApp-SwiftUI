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
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing: 40) {
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
                    // Uncomment to make the API call
                    // authViewModel.login(email: email, password: password)
                    authViewModel.authenticated.toggle()
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.all, 10)
                }
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
