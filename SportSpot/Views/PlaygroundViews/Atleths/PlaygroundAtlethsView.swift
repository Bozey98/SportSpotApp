//
//  PlaygroundAtlethsView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 17.11.2020.
//

import SwiftUI

struct PlaygroundAtlethsView: View {
    var body: some View {
        VStack() {
            BigPlaygroundKing()
                .padding(.top)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Сейчас на площадке")
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                ForEach(0..<10) { index in
                    OnlineAtlethRow(isOnline: true, subtitle: "Занимается 45 минут")
                }
            }.padding(.vertical)
        }.padding(.horizontal, 24)
    }
}

struct PlaygroundAtlethsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundAtlethsView()
    }
}
