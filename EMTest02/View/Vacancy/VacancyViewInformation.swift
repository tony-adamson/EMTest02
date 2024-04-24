//
//  VacancyViewInformation.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

enum InformationType {
    case applied
    case looking
}

struct VacancyViewInformation: View {
    let containerWidth: CGFloat
    let image: Image
    let personNumber: Int
    let type: InformationType
    
    var body: some View {
        let itemWidth = (containerWidth - 40) / 2
        let text: String = {
            switch type {
            case .applied:
                return "\(personNumber) человек уже\n откликнулось"
            case .looking:
                return "\(personNumber) человек сейчас смотрят"
            }
        }()
        
        HStack(alignment: .top) {
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.white)
                .padding([.leading, .top], 8)
            
            Spacer()
            
            VStack {
                image
                    .padding([.top, .trailing], 8)
                Spacer()
            }
        }
        .frame(width: itemWidth, height: 56)
        .background(.darkGreen)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    VacancyViewInformation(containerWidth: 450, image: Image("personGreen"), personNumber: 10, type: .applied)
}
