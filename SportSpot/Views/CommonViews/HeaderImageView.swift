//
//  HeaderImageView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 15.11.2020.
//

import SwiftUI

struct HeaderImageView: View {
    
    var height: CGFloat
    var cornerRadius: CGFloat
    
    init(height: CGFloat, cornerRadius: CGFloat = 30) {
        self.height = height
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        Image("tempImage")
            .resizable()
            .scaledToFill()
            .height(height)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        
            
        
            
    }
}

struct HeaderImageView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderImageView(height: 197, cornerRadius: 30)
    }
}
