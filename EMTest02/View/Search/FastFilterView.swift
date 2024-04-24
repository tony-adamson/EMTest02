//
//  FastFilterView.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

struct FastFilterView: View {
    let mainText: String
    let additionalText: String?
    let image: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .padding(.top, 10)
                .padding(.leading, 8)
            Spacer().frame(height: 16)
            Text(mainText)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(.leading, 8)
            if additionalText == nil {
                Spacer()
            } else {
                Text(additionalText!)
                    .font(.subheadline)
                    .foregroundStyle(.green)
                    .padding(.leading, 8)
                    .padding(.bottom, 11)
            }
        }
        .frame(width: 132, height: 120, alignment: .leading)
        .background(.grey1)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    FastFilterView(
        mainText: "Поднять резюме\nв поиске",
        additionalText: "Поднять",
        image: "geoIconBlue")
}
