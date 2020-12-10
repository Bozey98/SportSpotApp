//
//  PlaygroundKing.swift
//  SportSpot
//
//  Created by Денис Мусатов on 15.11.2020.
//

import SwiftUI

struct PlaygroundKing: View {
    var body: some View {
        ZStack {
            Image("tempSportsman")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 36, height: 36)
            ZStack {
                Circle()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.darkBlue)
                Image("crown")
            }.offset(x: 11, y: 12)
        }
            
    }
}

struct PlaygroundKing_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundKing()
    }
}
