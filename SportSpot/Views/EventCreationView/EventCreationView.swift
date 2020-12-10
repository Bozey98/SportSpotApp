//
//  EventCreationView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 19.11.2020.
//

import SwiftUI

struct EventCreationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var eventName = ""
    @State var eventDescription = ""
    
    @State var showNotifications = false
    
    @State var pickedSportType = properties[0]
    
    @State var minPeopleCount = 1
    
    @State var date = Date()
    
    @State var showDatePicker = false
    
    @State var sportChoice = 0
    @State var ageChoice = 0
    @State var durationChoice = 0
    
    var body: some View {
        ScrollView {
            HStack {
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                }.buttonStyle(HeaderButtonStyle())
                Spacer()
            }.padding(.horizontal, 24)
            
            VStack(alignment: .leading, spacing: 25) {
                
                
                Text("Создание ивента")
                    .foregroundColor(.black)
                    .font(.system(size: 23))
                    .bold()
                
                VStack(spacing: 20) {
                    InputTextCard("Название",height: 55, inputText: $eventName)
                    InputTextCard("Описание",height: 140, inputText: $eventDescription)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    EventPropertyRow(
                        title: "Хипстерская площадка",
                        subtitle: "Мясницкий проспект 55",
                        icon: {
                            Image("minimapPin")
                        }
                    )
                    
                    VStack(spacing: 0) {
                        HStack {
                            EventPropertyRow(
                                title: "Вторник",
                                subtitle: "13:30",
                                icon: {
                                    EventDateIcon()
                                }
                            ).onTapGesture {
                                withAnimation { showDatePicker.toggle() }
                            }
                            Spacer()
                            
                            ToggleView(isOn: $showNotifications)
                            
                            Text("Оповестить")
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                        }
                        if showDatePicker {
                            DatePicker("", selection: $date)
                                .datePickerStyle(WheelDatePickerStyle())
//                                .foregroundColor(.black)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Вид спорта")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .bold()
                    
                    GridView(EventCreationView.properties, columns: 2) { property in
                        SportTypeCard(property: property, $pickedSportType)
                            .onTapGesture {
                                self.pickedSportType = property
                            }
                            
                    }

                    
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Минимум участников")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .bold()
                    
                    CountPicker(count: $minPeopleCount)
                }
                
                VStack(alignment: .leading, spacing: 25) {
                   
                    InputPickerCard("Уровень подготовки", pickedValue: $sportChoice, content: levelTypes)
                        
                    
                    
                    
                    HStack(alignment: .top, spacing: 25) {
                        InputPickerCard("Возраст", pickedValue: $ageChoice, content: ages)

                        InputPickerCard("Длительность", pickedValue: $durationChoice, content: duration)
                        
                    }
                }.padding(.vertical,5)
                
                Button(action: {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 33)
                            .foregroundColor(.skyBlue)
                        Text("Создать ивент")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }.frame(height: 52)
                }
                
                
            }.padding(.horizontal, 24)
        }
        .background(Color.backgroundColor.edgesIgnoringSafeArea(.all))
        .hideBar()
    }
    
    static let properties = [
        Property(key: "basketball", value: "Баскетбол"),
        Property(key: "football", value: "Футбол"),
        Property(key: "volleyball", value: "Волейбол"),
        Property(key: "workout", value: "Тренажеры")]
    
    let levelTypes = ["Аут","Новичок","Средничок","Топчик","БОГ"]
    let ages = (18...99).map { "\($0)+"}
    let duration = (1...12).map { "\($0) ч."}
    
}

struct EventCreationView_Previews: PreviewProvider {
    static var previews: some View {
        EventCreationView()
    }
}
