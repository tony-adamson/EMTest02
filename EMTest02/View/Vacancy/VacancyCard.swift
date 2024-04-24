//
//  VacancyCard.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

struct VacancyCard: View {
    var body: some View {
        NavigationLink(destination: VacancyView()) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Сейчас просматривает 7 человек")
                        .foregroundStyle(.green1)
                        .font(.caption)
                    Spacer()
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Text("UX дизайнер")
                Text("2500-5000")
                Text("Минск")
                Text("Софт-софт")
                HStack {
                    Image(systemName: "case")
                        .imageScale(.small)
                    Text("Jgsn 3-6 ktr")
                }
                Text("Опубликовано 14 февраля")
                    .foregroundStyle(.grey3)
                Button("Откликнуться") {
                    
                }
                .frame(height: 32)
                .frame(maxWidth: .infinity)
                .background(.green1)
                .clipShape(RoundedRectangle(cornerRadius: 50))
            }
            .padding()
            .background(.grey1)
            .foregroundStyle(.white1)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    VacancyCard()
}
