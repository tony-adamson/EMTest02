//
//  WorkerLogin.swift
//  EMTest02
//
//  Created by Антон Адамсон on 24.04.2024.
//

import SwiftUI

struct WorkerLogin: View {
    @ObservedObject var viewModel: LoginViewModel
    
    @State private var navigateToEnterCode = false
    
    private var placeholderText: Text {
        Text("Электронная почта и телефон")
            .font(.subheadline)
            .foregroundStyle(.grey4)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Поиск работы")
                .font(.subheadline)
                .padding(.top, 8)
            
            customTextInput()
            
            if !viewModel.validEmail {
                Text("Вы ввели неверный e-mail")
                    .foregroundStyle(.red)
                    .font(.caption)
                    .padding(.top, 8)
            }
                
            HStack {
                Button("Продолжить") {
                    viewModel.updateValidEmail()
                    if viewModel.validEmail {
                        navigateToEnterCode = true
                    }
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(viewModel.validEmail ? .blue1 : .gray)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .disabled(viewModel.email.isEmpty)
                
                Button("Войти с паролем") {
                    
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(.clear)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .foregroundStyle(.blue1)
            }
            .padding(.bottom, 8)
                
            NavigationLink(
                destination: EnterCodeView(email: viewModel.email),
                isActive: $navigateToEnterCode) {
                EmptyView()
            }
        }
        .padding()
        .foregroundStyle(.white1)
        .background(.grey1)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    fileprivate func customTextInput() -> ZStack<TupleView<(some View, (some View)?)>> {
        return ZStack {
            HStack {
                if viewModel.email == "" {
                    Image(systemName: "envelope")
                        .foregroundStyle(.grey4)
                        .padding(.leading, 8)
                }
                
                TextField("", text: $viewModel.email, prompt: placeholderText)
                    .foregroundStyle(.white)
                    .frame(height: 40)
                    .padding(.leading, 8)
                    .onChange(of: viewModel.email) { _, _ in
                        viewModel.validEmail = true
                    }
                
            }
            .background {
                Color.grey2
                    .frame(height: 40)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(viewModel.validEmail ? Color.clear : Color.red))
            }
            
            if !viewModel.email.isEmpty {
                HStack {
                    Spacer()
                    Button {
                        viewModel.email = ""
                        viewModel.validEmail = true
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.grey4)
                            .padding(.trailing, 8)
                    }
                }
                .frame(height: 40)
                .cornerRadius(8)
            }
        }
    }
}

#Preview {
    WorkerLogin(viewModel: LoginViewModel())
}
