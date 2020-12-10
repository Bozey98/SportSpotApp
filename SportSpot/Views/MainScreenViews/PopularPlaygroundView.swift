//
//  PopularPlaygroundView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 09.11.2020.
//

import SwiftUI

struct PopularPlaygroundView: View {
    var body: some View {
        ZStack {
            Color.white
                
            GeometryReader { geo in
                VStack {
                    Image("tempImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height/2)
                        .clipped()
                        
                        
                        
                        
                    VStack {
                        HStack {
                            Circle().frame(width: 3, height: 3)
                            Text("Баскетбол")
                            
                            Circle().frame(width: 3, height: 3)
                            Text("Футбол")
                            
                            Spacer()
                        }.foregroundColor(Color("captionColor")).font(.caption)
                        
                        HStack {
                            Text("Хипстерская площадка")
                                // .font(.title)
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .bold()
                            Spacer()
                        }
                        
                        HStack {
                            Image("pinMain")
                            Text("Мясницкий проспект 55")
                                .foregroundColor(Color("captionColor"))
                                .font(.footnote)
                            Spacer()
                        }
                        
                        HStack {
                            Image("clock")
                            Text("Открыто до 22:00")
                                .foregroundColor(Color("captionColor"))
                                .font(.footnote)
                            Spacer()
                        }
                    }.padding(.leading)
                    
                    
                }
                
                
            }
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(width: 260, height: 300)
        .padding(.bottom)
        .shadow(color: Color.gray.opacity(0.16), radius: 10.0, x: 0, y: 0)
    }
}

struct PopularPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPlaygroundView()
    }
}
