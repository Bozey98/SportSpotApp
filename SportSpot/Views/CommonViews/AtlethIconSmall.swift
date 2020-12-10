//
//  AtlethIconSmall.swift
//  SportSpot
//
//  Created by Денис Мусатов on 16.11.2020.
//

import SwiftUI

struct AtlethIconSmall: View {
    
    @State var isOnline: Bool
    
    var body: some View {
        ZStack {
            Image("tempSportsman")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            Circle()
                .frame(width: 12, height: 12)
                .overlay(Circle().stroke(lineWidth: 1).foregroundColor(.white))
                .foregroundColor(isOnline ? .green : .captionGrey)
                .offset(x: 20, y: -20)
        }
    }
}

struct AtlethIconSmall_Previews: PreviewProvider {
    static var previews: some View {
        AtlethIconSmall(isOnline: true)
    }
}
