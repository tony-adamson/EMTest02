//
//  VacancyView.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

struct VacancyView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var jobViewModel: JobViewModel
    var vacancy: Vacancy
    
    var body: some View {
        var schedulesText: String {
            let formattedSchedules = vacancy.schedules.map { $0.lowercased() }.joined(separator: ", ")
            return formattedSchedules.prefix(1).uppercased() + formattedSchedules.dropFirst()
        }
        
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    // vacancy name
                    Text(vacancy.title)
                        .font(.title2)
                    
                    VStack(alignment: .leading) {
                        // vacancy salary
                        Text(vacancy.salary.full)
                            .font(.callout)
                        // vacancy experience
                        Text("Требуемый опыт: \(vacancy.experience.text)")
                            .font(.callout)
                    }
                    
                    // schedules
                    HStack {
                        Text(schedulesText)
                            .font(.callout)
                    }
                    // optional block applied and looking
                    HStack {
                        if vacancy.appliedNumber != nil {
                            VacancyViewInformation(
                                containerWidth: geometry.size.width,
                                image: Image("personGreen"),
                                personNumber: vacancy.appliedNumber!, 
                                type: .applied
                            )
                        }
                        if vacancy.lookingNumber != nil {
                            VacancyViewInformation(
                                containerWidth: geometry.size.width,
                                image: Image("eyeGreen"), 
                                personNumber: vacancy.lookingNumber!,
                                type: .looking
                            )
                        }
                    }
                    
                    // map block
                    VStack(alignment: .leading) {
                        HStack {
                            Text(vacancy.company)
                            Image("checkIcon")
                        }
                        Image("mapTemplate")
                            .resizable()
                            .frame(height: 58)
                        Text("\(vacancy.address.town), \(vacancy.address.street) \(vacancy.address.house)")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.grey2)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    // vacancy description
                    if vacancy.description != nil {
                        Text(vacancy.description!)
                    }
                    
                    Text("Ваши задачи")
                        .font(.title2)
                    
                    // vacancy responsibilities
                    Text(vacancy.responsibilities)
                    
                    Text("Задайте вопрос работодателю")
                    
                    Text("Он получит его вместе с ответом на вакансию")
                    
                    // vacancy questions
                    VStack(alignment: .leading) {
                        ForEach(vacancy.questions, id: \.self) { question in
                            QuestionView(question: question)
                        }
                    }
                    
                    Button("Откликнуться") {
                        
                    }
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .background(.green1)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                }
                .padding()
            }
        }
        .foregroundStyle(.white1)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true) // Скрываем стандартную кнопку назад
        .navigationBarItems(leading: backButton, trailing: actionButtons)
        .foregroundStyle(.white)
        .background(Color.grey1.edgesIgnoringSafeArea(.all))
    }
    
    private var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
        }
    }

    private var actionButtons: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "eye")
            }
            Button(action: {}) {
                Image(systemName: "link")
            }
            Button(action: {
                // Действие для кнопки лайк
            }) {
                Image(systemName: vacancy.isFavorite ? "heart.fill" : "heart")
            }
        }
    }
}

#Preview {
    VacancyView(vacancy: Vacancy(
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
