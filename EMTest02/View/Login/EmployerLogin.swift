//
//  EmployerLogin.swift
//  EMTest02
//
//  Created by Антон Адамсон on 24.04.2024.
//

import SwiftUI

struct EmployerLogin: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Поиск сотрудников")
                .font(.subheadline)
                .padding(.top, 8)
            
            Text("Размещение вакансий и доступ к базе резюме")
                .font(.caption)
            
            Button("Откликнуться") {
                
            }
            .frame(height: 32)
            .frame(maxWidth: .infinity)
            .background(.green1)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .padding(.bottom, 8)
        }
        .padding()
        .foregroundStyle(.white1)
        .background(.grey1)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    EmployerLogin()
}
