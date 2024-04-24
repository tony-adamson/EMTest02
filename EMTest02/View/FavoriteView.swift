//
//  FavoriteView.swift
//  EMTest02
//
//  Created by Антон Адамсон on 24.04.2024.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var jobViewModel: JobViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(jobViewModel.favorites) { vacancy in
                        VacancyCard(vacancy: vacancy)
                    }
                    .navigationTitle("Избранные Вакансии")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Избранные Вакансии")
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                    }
                }
            }
            .foregroundStyle(.white1)
            .background(Color.black1.edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    FavoriteView()
        .environmentObject(JobViewModel())
}
