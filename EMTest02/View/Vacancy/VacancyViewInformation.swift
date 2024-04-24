//
//  VacancyViewInformation.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

struct VacancyViewInformation: View {
    let containerWidth: CGFloat
    let image: Image
    
    var body: some View {
        let itemWidth = (containerWidth - 40) / 2
        
        HStack(alignment: .top) {
            Text("120 человек уже\n откликнулось")
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
    VacancyViewInformation(containerWidth: 450, image: Image("personGreen"))
}
