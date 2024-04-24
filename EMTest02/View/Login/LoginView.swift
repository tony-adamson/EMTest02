//
//  LoginView.swift
//  EMTest02
//
//  Created by Антон Адамсон on 24.04.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Вход в личный кабинет")
                
                // worker view
                WorkerLogin(viewModel: viewModel)
                    .padding(.top, 110)
                
                // employer view
                EmployerLogin()
                
                Spacer()
            }
            .padding()
            .foregroundStyle(.white1)
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        
    }
}

#Preview {
    LoginView()
}
