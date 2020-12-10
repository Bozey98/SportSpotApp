//
//  SportTypeCard.swift
//  SportSpot
//
//  Created by Денис Мусатов on 20.11.2020.
//

import SwiftUI

struct SportTypeCard: View {
    
    var property: Property
    
    @Binding var pickedSportType: Property
    
    init(property: Property, _ pickedSportType: Binding<Property>) {
        self.property = property
        self._pickedSportType = pickedSportType
    }
    
    var body: some View {
        HStack(spacing: 15) {
            Image(property.key)
                .resizable()
                .frame(width: 32, height: 32)
            Text(property.value)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(property == pickedSportType ? .white : .black)
                .font(.system(size: 14))
            //Spacer()
        }
        
        .padding(12)
        .background(property == pickedSportType ? Color.darkBlue : Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.gray.opacity(0.2), radius: 15, x: 0, y: 0)
        
        
    }
}

struct SportTypeCard_Previews: PreviewProvider {
    static var previews: some View {
        SportTypeCard(property: Property(key: "football", value: "Футбол"), .constant(Property(key: "football", value: "Футбол")))
    }
}
