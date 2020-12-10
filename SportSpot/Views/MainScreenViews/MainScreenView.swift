//
//  MainScreenView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 09.11.2020.
//

import SwiftUI

struct MainScreenView: View {
    
    @EnvironmentObject var tabViewModel: TestTabViewModel
    @State private var addres = ""
    
    var placeholder: some View {
        Text("Введите адрес")
            .foregroundColor(.black)
            .font(.footnote)
            .padding(.leading)
            .opacity(0.5)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                //Filter header
                FilterView()
                
                //Popular sport points
                VStack(alignment: .leading) {
                    Text("Популярные площадки")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .bold()
                        .padding(.leading, 24)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 25) {
                            Text("Любой вид")
                                .bold()
                                .foregroundColor(Color("skyBlue"))

                            Text("Футбол")
                                
                            Text("Баскетбол")
                                
                            Text("Волейбол")
                               
                            Text("Воркаут")
                               
                            Text("Теннис")
                                

                        }
                        .foregroundColor(Color("captionColor"))
                        .font(.subheadline)
                        .padding([.leading, .trailing], 24)

                    }.padding(.vertical, 10)




                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            PopularPlaygroundView()
                                
                            PopularPlaygroundView()
                                
                            PopularPlaygroundView()
                                
                        }.padding([.leading, .trailing], 24)

                    }


                }
                    .padding(.top)
                
                //To map button
                Button(action: {self.tabViewModel.current = 1}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 33)
                            .foregroundColor(Color("lightBlue"))

                        Text("Перейти на карту")
                            .font(.subheadline)
                            .foregroundColor(Color("skyBlue"))
                            .bold()
                        
                    }.frame(height: 52)
                }
                .padding(.bottom)
                .padding([.leading, .trailing], 24)
                
                //Sportsmen online
                VStack(alignment: .leading) {
                    Text("Тренируются сейчас")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .bold()

                    ForEach(0..<5) { index in
                        OnlineAtlethRow(isOnline: true, address: "Плющина 52")
                    }
                    .padding(.top)
                    .padding(.leading, 5)


                }
                .padding(.horizontal, 24)
                .padding(.vertical)
                
                //Nearest events
                
                VStack(alignment: .leading) {
                    
                    Text("Ближайшие ивенты")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .bold()
                    
                    ForEach(0..<5) { index in
                        NavigationLink(destination: EventView()) {
                            EventCard()
                        }
                    }
                    
                }
                .padding([.leading, .trailing], 24)
                .padding(.vertical)
                .padding(.bottom)
                
                

                Spacer()
                
               
            }
            
        }
        .background(Color.backgroundColor.edgesIgnoringSafeArea(.all))
        
        //.padding(.bottom)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
