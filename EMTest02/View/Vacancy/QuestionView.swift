//
//  QuestionView.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
            Text("Какой график работы?")
                .padding(8)
                .background(.grey2)
                .foregroundStyle(.white1)
                .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}

#Preview {
    QuestionView()
}
