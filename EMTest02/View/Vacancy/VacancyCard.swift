//
//  VacancyCard.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

struct VacancyCard: View {
    @EnvironmentObject var jobViewModel: JobViewModel
    var vacancy: Vacancy
    
    var body: some View {
        NavigationLink(destination: VacancyView(vacancy: vacancy)) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    if vacancy.lookingNumber != nil {
                        Text("Сейчас просматривает \(vacancy.lookingNumber!) человек")
                            .foregroundStyle(.green1)
                        .font(.caption)
                    }
                    Spacer()
                    Image(systemName: vacancy.isFavorite ? "heart.fill" : "heart")
                        .imageScale(.large)
                }
                Text(vacancy.title)
                    .multilineTextAlignment(.leading)
                if vacancy.salary.short != nil {
                    Text(vacancy.salary.short!)
                }
                Text(vacancy.address.town)
                Text(vacancy.company)
                HStack {
                    Image(systemName: "case")
                        .imageScale(.small)
                    Text(vacancy.experience.previewText)
                }
                Text("Опубликовано \(vacancy.publishedDate)")
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
    VacancyCard(vacancy: Vacancy(
        id: "cbf0c984-7c6c-4ada-82da-e29dc698bb50",
        title: "UI/UX дизайнер",
        address: Address(town: "Минск", street: "улица Бирюзова", house: "4/5"),
        company: "Мобирикс",
        experience: Experience(previewText: "Опыт от 1 до 3 лет", text: "1–3 года"),
        publishedDate: "2024-02-20",
        isFavorite: false,
        salary: Salary(full: "Уровень дохода не указан"),
        schedules: ["полная занятость", "полный день"],
        responsibilities: "- проектирование пользовательских сценариев и создание прототипов;",
        questions: ["Где располагается место работы?",
                    "Какой график работы?",
                    "Вакансия открыта?",
                    "Какая оплата труда?"])
    )
        .environmentObject(JobViewModel())
}
