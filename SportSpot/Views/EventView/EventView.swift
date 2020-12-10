//
//  EventView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 18.11.2020.
//

import SwiftUI

struct EventView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                HeaderImageView(height: 260, cornerRadius: 24)
                
                //Header buttons
                HStack {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                    }.buttonStyle(HeaderButtonStyle()).opacity(0.8)
                    
                    Spacer()
                    Button(action: {}) {
                        ButtonInfoIcon()
                    }.buttonStyle(HeaderButtonStyle()).opacity(0.8)
                    
                }
                .padding(.horizontal, 24)
                .padding(.top, 45)
            }
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    OnlineAtlethRow(isOnline: true, subtitle: "Создатель ивента", showArrow: false)
                    
                    Divider()
                    
                    Text("Стритбол 3 на 3")
                        .bold()
                        .font(.system(size: 23))
                        .foregroundColor(.black)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        EventPropertyRow(
                            title: "Хипстерская площадка",
                            subtitle: "Мясницкий проспект 55",
                            icon: {
                                Image("minimapPin")
                            }
                        )
                        
                        HStack {
                            EventPropertyRow(
                                title: "Вторник",
                                subtitle: "13:30",
                                icon: {
                                    EventDateIcon()
                                }
                            )
                            
                            Spacer()
                            
                            EventPropertyRow(
                                title: "Баскетбол",
                                subtitle: "От 2 человек",
                                icon: {
                                    Image("basketball")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                }
                            )
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Об ивенте")
                            .bold()
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                        
                        Text("Многофункциональная спортивная площадка представляет собой комплекс сооружений, включающий крытую универсальную спортивную площадку размером 60х30 метров, огороженную хоккейными бортами,")
                            .font(.system(size: 14))
                            .foregroundColor(.captionGrey)
                            .lineSpacing(4)
                        
                        
                        GridView(properties, columns: 2, spacing: 0) { property in
                            PropertyCard(property: property)
                        }.padding(.top, 5)
                        
                        
                    }.padding(.vertical, 25)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Присоединившиеся атлеты")
                                .bold()
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                            Text("2")
                                .font(.system(size: 14))
                                .foregroundColor(.captionGrey)
                        }
                        
                        
                        ForEach(0..<2) { _ in
                            OnlineAtlethRow(isOnline: true)
                        }
                        
                    }
                    
                    Button(action: {}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 33)
                                .foregroundColor(.skyBlue)
                            Text("Присоединиться")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }.frame(height: 52)
                    }.padding(.vertical)
                    
                   
                    
                    
                    
                    
                    
                    
                    
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 25)
            }
            
        }.edgesIgnoringSafeArea(.vertical)
        .background(Color.backgroundColor.edgesIgnoringSafeArea(.vertical))
        .hideBar()
    }
    
    let properties = [Property(key: "Уровень подготовки", value: "Средний"), Property(key: "Возраст", value: "От 20 лет")]
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventView()
            EventView()
        }
    }
}
