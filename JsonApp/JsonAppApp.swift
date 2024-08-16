//
//  JsonAppApp.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 13/08/24.
//

import SwiftUI

@main
struct JsonAppApp: App {
    var body: some Scene {
        let authViewModel = AuthViewModel()
        
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
