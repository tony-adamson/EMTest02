//
//  SearchBar.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        HStack {
            Label("Поиск", systemImage: "magnifyingglass")
                .frame(width: 280, height: 40, alignment: .leading)
                .padding(8)
                .background(.grey2)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Spacer()
            Image("settingsIcon")
                .frame(width: 40, height: 40)
                .padding(8)
                .background(.grey2)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    SearchBar()
}
