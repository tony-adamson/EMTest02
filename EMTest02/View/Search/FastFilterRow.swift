//
//  FastFilterRaw.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

struct FastFilterRow: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                FastFilterView(
                    mainText: "Вакансии\nрядом с вами",
                    additionalText: nil,
                    image: "geoIconBlue"
                )
                FastFilterView(
                    mainText: "Поднять резюме в поиске",
                    additionalText: "Поднять",
                    image: "starIconGreen"
                )
                FastFilterView(
                    mainText: "Временная\nработа и\nподработка",
                    additionalText: nil,
                    image: "listIconGreen"
                )
            }
        }
    }
}

#Preview {
    FastFilterRow()
}
