//
//  AboutPlaygroundView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 15.11.2020.
//

import SwiftUI

struct AboutPlaygroundView: View {
    
    @State var rating = 4
    
    let starSize = UIScreen.main.bounds.width / 14
    let textSize = UIScreen.main.bounds.width / 25
    let paddingSize = UIScreen.main.bounds.width / 17
    
    var body: some View {

        VStack(spacing: 30) {
            
            // About playground
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                Text("О площадке")
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                
                HStack {
                    RatingView(rating: $rating, size: starSize, spacing: 11)
                        
                    Spacer()
                    Text("4.1 из 5.0")
                        .font(.system(size: textSize))
                        .foregroundColor(.captionGrey)
                }
                .padding(.vertical)
                .padding(.horizontal, paddingSize)
                .background(Color.lightBlue)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                
                
            }

            
            //Feed back
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    Text("Отзывы")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text("2")
                        .font(.subheadline)
                        .foregroundColor(.captionGrey)
                        
                    
                    Spacer()
                    NavigationLink(destination: FeedbacksListView()) {
                        HStack {
                            Text("Смотреть все")
                                .font(.callout)
                                .fontWeight(.medium)
                            Image(systemName: "chevron.right")
                                .font(.system(size: 20))
                        }
                        .foregroundColor(.skyBlue)
                    }
                    
                }
                
                FeedbackView()
            }
            
            // Properties
            
            VStack(alignment: .leading) {
                Text("Характеристики")
                    .bold()
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .padding(.bottom)
                
                GridView(properties, columns: 2, spacing: 10) { property in
                    PropertyCard(property: property)
                }

            }
            
            // Mistake
            
            VStack {
                Button(action: {}) {
                    Text("Сообщить об ошибке")
                        .foregroundColor(.red)
                        .font(.system(size: 16))
                }
            }.padding(.vertical)
        }
        .padding(.horizontal, 24)
        
    }
    
    
    let properties = [Property(key: "Качество", value: "Новая"), Property(key: "Покрытие", value: "Резиновое"), Property(key: "Освещение", value: "Светодиодное"), Property(key: "Тип", value: "Крытая площадка"), Property(key: "Раздевалка", value: "Есть"), Property(key: "Душ", value: "Есть"), Property(key: "Инвентарь", value: "4 футбольных мяча")]
}

struct AboutPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        AboutPlaygroundView()
    }
}
