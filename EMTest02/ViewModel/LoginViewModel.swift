//
//  LoginViewModel.swift
//  EMTest02
//
//  Created by Антон Адамсон on 24.04.2024.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var validEmail: Bool = true
    
    func updateValidEmail() {
        validEmail = isValidEmail(email)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}

