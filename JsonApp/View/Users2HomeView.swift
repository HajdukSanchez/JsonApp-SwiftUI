//
//  Users2HomeView.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 20/08/24.
//

import SwiftUI

struct Users2HomeView: View {
    
    @StateObject var user2VM = Users2ViewModel.shared
    @EnvironmentObject var authVM : AuthViewModel
    
    var body: some View {
        if user2VM.users.data.isEmpty {
            ProgressView()
        } else {
            List(user2VM.users.data, id: \.id) { item in
                NavigationLink(destination: UserDetailView(userId: item.id)){
                    HStack {
                        Image(systemName: "person")
                            .imageFromUrl(url: URL(string: item.avatar)!)
                            .frame(width: 60, height: 60)
                            .clipped()
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(item.first_name)
                                .font(.title)
                            Text(item.email)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarTitle("Users 2")
        }
    }
}

// MARK: - Image
extension Image {
    func imageFromUrl(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self.resizable()
    }
}

#Preview {
    Users2HomeView(user2VM: Users2ViewModel.test)
}
