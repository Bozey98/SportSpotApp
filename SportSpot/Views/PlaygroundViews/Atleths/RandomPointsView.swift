//
//  RandomPointsView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 17.11.2020.
//

import SwiftUI

struct RandomPointsView: View {
    
    let colors: [Color] = [.red, .yellow, .blue, .pink, .orange, .purple]
    let frame: CGSize
    
    init(in frame: CGSize) {
        self.frame = frame
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<colors.count) { index in
                Circle().frame(width: 6, height: 6)
                    .foregroundColor(colors[index])
                    .position(
                        x: CGFloat.random(in: 10...frame.width - 10),
                        y: CGFloat.random(in: 10...frame.height / 3)
                    )
                
                Circle().frame(width: 6, height: 6)
                    .foregroundColor(colors[index])
                    .position(
                        x: CGFloat.random(in: 10...frame.width - 10),
                        y: CGFloat.random(in: frame.height * 2/3 + 10...frame.height - 10)
                    )
            }
        }.frame(width: frame.width, height: frame.height)
    }
}

//struct RandomPointsView_Previews: PreviewProvider {
//    static var previews: some View {
//        RandomPointsView(in)
//    }
//}
