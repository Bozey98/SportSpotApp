//
//  MainMapView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 13.11.2020.
//

import SwiftUI

struct MainMapView: View {
    
    let mapView = MapView()
    @State var show = false
    
    var body: some View {
        ZStack {
            mapView.edgesIgnoringSafeArea(.all)
            
            VStack {
                FilterView()
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        mapView.setCenter(isAnimated: true)
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12.0)
                                .foregroundColor(Color("darkBlue"))
                            Image("location")
                        }
                    }
                    .buttonStyle(TapStyle())
                    .padding(.trailing)
                    .padding(.bottom, 30)
                }.padding(.bottom)
            }
        }
        
       
    }
}

struct MainMapView_Previews: PreviewProvider {
    static var previews: some View {
        MainMapView()
    }
}
