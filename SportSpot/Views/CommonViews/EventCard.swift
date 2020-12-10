//
//  EventCard.swift
//  SportSpot
//
//  Created by Денис Мусатов on 12.11.2020.
//

import SwiftUI

struct EventCard: View {
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
                .shadow(color: Color.gray.opacity(0.2), radius: 15.0, x: 0, y: 0)
            
           
            HStack(alignment: .top, spacing: 0) {
                    
                    VStack() {
                        Image("basketball")
                            .resizable()
                            .frame(width: 44, height: 44)
                        ZStack {
                            RoundedRectangle(cornerRadius: 22)
                                .foregroundColor(Color("lightBlue"))
                                .frame(width: 52, height: 25)
                            Text("200 м")
                                .font(.caption)
                                .foregroundColor(Color("skyBlue"))
                        }
                       
                        
                    }.padding(.horizontal)
                    
                VStack(alignment: .leading, spacing: 6) {
                        Text("Тренировака здоровых котят")
                            .foregroundColor(.black)
                            .font(.subheadline)
                            .bold()
                        
                        
                        Text("Мы продолжаем тренироваться и достигать поставленные цели, присоединяйтесь к нам!")
                            
                            .font(.caption)
                            .foregroundColor(Color("captionColor"))
                            
                        
                        
                        Spacer(minLength: 0)
                        
                        
                        HStack {
                            Image("calendar")
                            Text("12 мая, 14:35")
                                .font(.caption)
                                .foregroundColor(Color("captionColor"))
                            
                            Spacer(minLength: 0)
                            
                            ZStack {
                                ForEach(0..<4) { index in
                                    Image("tempSportsman")
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(lineWidth: 0.5).foregroundColor(.white))
                                        .frame(width: 32, height: 32)
                                        .offset(x: CGFloat(-16*index))
                                }
                            }
                            
                            Text("+2")
                                .foregroundColor(Color("skyBlue"))
                                .font(.footnote)
                                
                        }.padding([.bottom,.trailing], 10)
                        
                            
                        
                    }
                    
                    
                }.padding(.top)

        }
        .frame(height: 145)
        
        .padding(.top)
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard()
    }
}
