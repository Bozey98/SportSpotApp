//
//  CircleImage.swift
//  SportSpot
//
//  Created by Денис Мусатов on 17.11.2020.
//

import SwiftUI

struct CircleImage: View {
    
    var imageName: String
    var size: CGFloat
    
    init(_ imageName: String, size: CGFloat) {
        self.imageName = imageName
        self.size = size
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: size, height: size)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage("tempSportsman", size: 60)
    }
}
