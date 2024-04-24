//
//  EMTest02App.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

@main
struct EMTest02App: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()
                    .environmentObject(JobViewModel())
            } else {
                LoginView()
            }
        }
    }
}
