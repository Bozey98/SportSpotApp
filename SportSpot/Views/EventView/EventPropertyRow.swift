//
//  EventPropertyRow.swift
//  SportSpot
//
//  Created by Денис Мусатов on 19.11.2020.
//

import SwiftUI

struct EventPropertyRow<Content: View>: View {
    
    let icon: Content
    let title: String
    let subtitle: String
    
    init(title: String, subtitle: String, @ViewBuilder icon: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon()
    }
    
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                RoundedRectangle(cornerRadius: 13)
                    .foregroundColor(.lightBlue)
                icon
            }.frame(width: 54, height: 54)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    
                Text(subtitle)
                    .foregroundColor(.captionGrey)
                   
                    
            }.font(.system(size: 14))
            
           
        }
    }
}

struct EventPropertyRow_Previews: PreviewProvider {
    static var previews: some View {
        EventPropertyRow(title: "Хипстерская площадка", subtitle: "Мясницкий проспект 55", icon: {Image("minimapPin")})
    }
}
