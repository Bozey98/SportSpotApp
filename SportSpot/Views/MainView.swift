//
//  ContentView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 09.11.2020.
//

import SwiftUI

struct MainView: View {
    
    
    
    var body: some View {

        TestMainTabView {
            MainScreenView()
            MainMapView()
            Text("1")
            Text("2")
        }.navigationView()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

