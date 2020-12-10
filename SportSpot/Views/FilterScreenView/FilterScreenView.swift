//
//  FilterScreenView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 06.12.2020.
//

import SwiftUI

struct FilterScreenView: View {
    
    @State var sportTypePicked = Property()
    @State var ratingPicked = 3
    
    @State var qualityPicked = 1
    @State var groundPicked = 1
    
    @State var nightLight = false
    
    @State var isOpen = false
    @State var isToday = false
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            
            //Header
            ZStack {
                Text("Фильтр")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                HStack {
                    Spacer()
                    Button(action: resetFilters) {
                        Text("Очистить")
                            .font(.system(size: 14))
                            .foregroundColor(.skyBlue)
                    }
                    
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 15)
            
            VStack(alignment: .leading, spacing: 35) {
                
                //Sport type picker
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Вид спорта")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    GridView(EventCreationView.properties, columns: 2) { property in
                        SportTypeCard(property: property, $sportTypePicked)
                            .onTapGesture {
                                self.sportTypePicked = property
                            }
                            
                    }
                    
                }
                
                //Rating picker
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Рейтинг площадки")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    RatingView(rating: $ratingPicked, size: 30, spacing: 10, isEditable: true)
                }
                
                
                
                //Distance picker
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack {
                        Text("Удаленность от меня").fontWeight(.semibold)
                        Spacer()
                        Text("\(Int(distancePicked)) км")
                    }.foregroundColor(.black).font(.system(size: 16))
                    
                    
                    VStack(spacing: 5) {
                        Slider(value: $distancePicked, in: 1...100, step: 1)
                            .foregroundColor(.red)
                        
                        HStack {
                            Text("0 км")
                            Spacer()
                            Text("100 км")
                        }.foregroundColor(.greyLabel).font(.system(size: 14))
                    }
                    
                }
                
                //Rating picker
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("О площадке")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    InputPickerCard("Качество площадки", pickedValue: $qualityPicked, content: qualityTypes)
                    
                    InputPickerCard("Тип покрытия", pickedValue: $groundPicked, content: groundTypes)
                    
                    CheckBoxView("Освещение ночью", picked: $nightLight)
                }
                
                //Addition
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Дополнительно")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    CheckBoxView("Открытые сейчас", picked: $isOpen)
                    
                    CheckBoxView("Есть встречи сегодня", picked: $isToday)
                    
                }
                
                
                
                
            }.padding(.horizontal, 24)
        }
        .background(Color.backgroundColor.edgesIgnoringSafeArea(.all))
    }
    
    @State var distancePicked: Float = 10
    
    static let properties = [
        Property(key: "basketball", value: "Баскетбол"),
        Property(key: "football", value: "Футбол"),
        Property(key: "volleyball", value: "Волейбол"),
        Property(key: "workout", value: "Тренажеры")]
    
    let qualityTypes = ["Говно","Среднее","Топ"]
    let groundTypes = ["Говно","Земля","Газон","Лава","Песок"]
    
    func resetFilters() {
        sportTypePicked = Property()
        ratingPicked = 0
        distancePicked = 0
        qualityPicked = 1
        groundPicked = 1
        nightLight = false
        isOpen = false
        isToday = false
        
    }
}

struct FilterScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FilterScreenView()
    }
}
