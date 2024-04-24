//
//  SearchView.swift
//  EMTest02
//
//  Created by Антон Адамсон on 24.04.2024.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var jobViewModel: JobViewModel
    @State var showAll = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    SearchBar()
                    // TODO: или быстрые филтры или сколько вакансий и сортировка
                    if !showAll {
                        FastFilterRow()
                    } else {
                        HStack {
                            Text("Количество вакансий")
                            Spacer()
                            Text("Сортировка по")
                        }
                    }
                    
                    Text("Вакансии для вас")
                        .font(.title2)
                    
                    if jobViewModel.isLoading {
                        Spacer()
                        ProgressView()
                            .scaleEffect(5)
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .padding(.top, 150)
                        Spacer()
                    } else {
                        if let vacancies = jobViewModel.jobData?.vacancies {
                            if showAll {
                                ForEach(vacancies) { vacancy in
                                    VacancyCard()
                                }
                            } else {
                                ForEach(vacancies.prefix(3)) { vacancy in
                                    VacancyCard()
                                }
                            }
                        }
                    }
                    
                    if !showAll && !jobViewModel.isLoading {
                        Button("Еще ХХХ вакансий") {
                            showAll = true
                        }
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .background(.blue1)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding()
            }
            .foregroundStyle(.white1)
            .background(Color.black1.edgesIgnoringSafeArea(.all))
        }
        .onAppear {
            jobViewModel.load()
        }
        .onDisappear {
            showAll = false
        }
    }
}

#Preview {
    let jobViewModel = JobViewModel()
    return SearchView()
        .environmentObject(jobViewModel)
}
