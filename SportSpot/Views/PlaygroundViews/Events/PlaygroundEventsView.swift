//
//  PlaygroundEventsView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 17.11.2020.
//

import SwiftUI

struct PlaygroundEventsView: View {
    var body: some View {

        ScrollView {
            VStack(spacing: 5) {
                    
                HStack {
                    Text("Ивенты")
                        .bold()
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    Text("1")
                        .font(.subheadline)
                        .foregroundColor(.captionGrey)
                    
                    Spacer()
                }
                
                VStack {
                    ForEach(0..<10) { index in
                        EventCard()
                    }
                }.padding(.bottom)
                
                NavigationLink(destination: EventCreationView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 33)
                            .foregroundColor(.skyBlue)
                        Text("Создать ивент")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }.frame(height: 52)
                }
                .padding(.vertical)
                
                
                

                
                
                
                
                    
                    
            }.padding(.horizontal, 24)
            
        }
    }
    
}

struct PlaygroundEventsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundEventsView()
    }
}
