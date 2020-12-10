//
//  BigPlaygroundKing.swift
//  SportSpot
//
//  Created by Денис Мусатов on 17.11.2020.
//

import SwiftUI

struct BigPlaygroundKing: View {
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.darkBlue)
                    .onAppear { print(geo.size)}
                RandomPointsView(in: geo.size)
                
            }
            
            HStack(spacing: 15) {
                CircleImage("tempSportsman", size: 60)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Петр Волынский")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                    Text("Царь Площадки")
                        .font(.system(size: 16))
                        .opacity(0.7)
                }.foregroundColor(.white)
                Spacer()
            }.padding(.horizontal, 24)
        }.height(125)
        
    }
}

struct BigPlaygroundKing_Previews: PreviewProvider {
    static var previews: some View {
        BigPlaygroundKing()
    }
}
