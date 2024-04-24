//
//  VacancyView.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

struct VacancyView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    /// vacancy name
                    Text("UI / UX Designer")
                        .font(.title2)
                    
                    VStack(alignment: .leading) {
                        /// vacancy salary
                        Text("Уровень дохода не указан")
                            .font(.callout)
                        /// vacancy experience
                        Text("Требуемый опыт: от 1 года до 3 лет")
                            .font(.callout)
                    }
                    
                    // TODO: need comment
                    Text("Полная занятость, Полный день")
                        .font(.callout)
                    // TODO: optional block
                    HStack {
                        VacancyViewInformation(
                            containerWidth: geometry.size.width,
                            image: Image("personGreen")
                        )
                        VacancyViewInformation(
                            containerWidth: geometry.size.width,
                            image: Image("eyeGreen")
                        )
                    }
                    /// map block
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Мобирикс")
                            Image("checkIcon")
                        }
                        Image("mapTemplate")
                            .resizable()
                            .frame(height: 58)
                        Text("Минск, улица Бирюзова, 4/5")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.grey2)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Text("MOBYRIX - динамично развивающаяся продуктовая IT-компания, специализирующаяся на разработке мобильных приложений для iOS и Android. Наша команда работает над собственными продуктами в разнообразных сферах: от утилит до развлечений и бизнес-приложений. Мы ценим талант и стремление к инновациям и в данный момент в поиске талантливого UX/UI Designer, готового присоединиться к нашей команде и внести значимый вклад в развитие наших проектов.")
                    
                    Text("Ваши задачи")
                        .font(.title2)
                    
                    Text("-Проектировать пользовательский опыт, проводить UX исследования; -Разрабатывать адаптивный дизайн интерфейса для мобильных приложений; -Разрабатывать быстрые прототипы для тестирования идеи дизайна и их последующая; интеграция на основе обратной связи от команды и пользователей; -Взаимодействовать с командой разработчиков для обеспечения точной реализации ваших дизайнов; -Анализ пользовательского опыта и адаптация под тренды.")
                    
                    Text("Задайте вопрос работодателю")
                    
                    Text("Он получит его вместе с ответом на вакансию")
                    
                    VStack {
                        QuestionView()
                        QuestionView()
                        QuestionView()
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
            // Здесь код для действия кнопки возврата
        }) {
            Image(systemName: "arrow.left")
        }
    }

    private var actionButtons: some View {
        HStack {
            Button(action: {
                // Действие для первой кнопки
            }) {
                Image(systemName: "eye")
            }
            Button(action: {
                // Действие для второй кнопки
            }) {
                Image(systemName: "link")
            }
            Button(action: {
                // Действие для третьей кнопки
            }) {
                Image(systemName: "heart")
            }
        }
    }
}

#Preview {
    VacancyView()
}
