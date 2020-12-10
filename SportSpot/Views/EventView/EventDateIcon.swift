//
//  EventDateIcon.swift
//  SportSpot
//
//  Created by Денис Мусатов on 19.11.2020.
//

import SwiftUI

struct EventDateIcon: View {
    
    let month = "Сентябрь"
    let day = 20
    
    
    var body: some View {
        VStack() {
            Text(month.uppercased().prefix(3))
                .font(.system(size: 14))
                .foregroundColor(.skyBlue)
            Text("\(day)")
                .font(.system(size: 14))
                .foregroundColor(.skyBlue)
                .bold()
        }
    }
}

struct EventDateIcon_Previews: PreviewProvider {
    static var previews: some View {
        EventDateIcon()
    }
}
