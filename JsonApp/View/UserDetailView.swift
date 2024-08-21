//
//  UserDetailView.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 20/08/24.
//

import SwiftUI

struct UserDetailView: View {
    
    var userId : Int
    @StateObject var userDetailVM = UserDetailViewModel.shared
    
    var body: some View {
        VStack {
            if let user = userDetailVM.user {
                Image(systemName: "person")
                    .imageFromUrl(url: URL(string: user.avatar)!)
                    .frame(width: 60, height: 60)
                    .clipped()
                    .clipShape(Circle())
                Text(user.first_name)
                    .font(.largeTitle)
                Text(user.email)
                    .font(.title)
            } else {
                ProgressView()
            }
        }
        .onAppear() {
            userDetailVM.fetchUser(with: userId)
        }
    }
}

#Preview {
    UserDetailView(userId: 1,
                   userDetailVM: UserDetailViewModel.test)
}
