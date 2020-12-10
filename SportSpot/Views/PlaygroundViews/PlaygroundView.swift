//
//  PlaygroundView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 13.11.2020.
//

import SwiftUI

struct PlaygroundView: View {
    
    let sports = ["Баскетбол","Футбол"]
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 38, height: 6)
                .foregroundColor(Color("lightGrey"))
                .opacity(0.2)
                .padding(.vertical, 10)
            ScrollView {
               
                        
                    HeaderImageView(height: 197)
                        .padding([.leading,.trailing], 24)
                    
                    VStack {
                        HStack {
                            ForEach(0..<2) { index in
                                HStack(spacing: 5) {
                                    Circle().frame(width: 3, height: 3)
                                    Text(sports[index])
                                }.foregroundColor(Color("captionColor")).font(.caption)
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Text("Хипстерская площадка")
                                .font(.system(size: 23))
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .bold()
                            Spacer()
                            PlaygroundKing()
                        }
                        
                        HStack(spacing: 15) {
                            HStack {
                                Image("pinMain")
                                Text("Мясницкий проспект 55")
                                    .foregroundColor(Color("captionColor"))
                                    .font(.footnote)
                            }
                            
                            
                            HStack(spacing: 5) {
                                Image("routeIcon")
                                Text("Маршрут")
                                    .foregroundColor(.skyBlue)
                                    .font(.footnote)
                            }
                            
                            Spacer()
                        }
                        
                        HStack {
                            Image("clock")
                            Text("Открыто до 22:00")
                                .foregroundColor(Color("captionColor"))
                                .font(.footnote)
                            Spacer()
                        }
                    }.padding([.leading, .trailing], 24)
                    .padding(.vertical)
                 
                    SubmenuViews()
                        .padding(.bottom, 30)
                
                
            }
            
            
        }
        .background(Color("background").edgesIgnoringSafeArea(.all))
        
    }
}

struct PlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundView()
    }
}
