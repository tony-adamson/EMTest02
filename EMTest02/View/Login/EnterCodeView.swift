//
//  EnterCodeView.swift
//  EMTest02
//
//  Created by Антон Адамсон on 24.04.2024.
//

import SwiftUI

struct EnterCodeView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    var email: String
    
    @State private var code = ["", "", "", ""]
    @FocusState private var focusedField: Int?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading) {
                    Text("Отправили код на \(email)")
                        .font(.custom("SFProDisplay-Semibold", size: 20))
                    
                    Text("Напишите его, чтобы подтвердить, что это\nвы, а не кто-то другой входит в личный\nкабинет (любые 4 цифры)")
                        .font(.custom("SFProDisplay-Medium", size: 16))
                        .padding(.top, 16)
                }
                    
                // Enter code block
                HStack {
                    ForEach(0..<4, id: \.self) { index in
                        TextField("", text: $code[index])
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .frame(width: 48, height: 48)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .focused($focusedField, equals: index)
                            .onReceive(code[index].publisher.collect()) {
                                self.code[index] = String($0.prefix(1))
                                if $0.count == 1 && index < 3 {
                                    focusedField = index + 1
                                }
                            }
                    }
                }
                .onAppear {
                    focusedField = 0
                }

                
                Button("Подтвердить") {
                    if code.allSatisfy({ $0.count == 1 && $0.rangeOfCharacter(from: .decimalDigits) != nil }) {
                        isLoggedIn = true
                    }
                }
                .disabled(!code.allSatisfy({ $0.count == 1 && $0.rangeOfCharacter(from: .decimalDigits) != nil }))
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(code.allSatisfy({ $0.count == 1 && $0.rangeOfCharacter(from: .decimalDigits) != nil }) ? .blue1 : .gray)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding()
            .foregroundStyle(.white1)
            .background(.grey1)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black) // Установка черного фона
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    EnterCodeView(email: "example@mail.ru")
}
