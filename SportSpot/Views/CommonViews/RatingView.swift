//
//  RatingView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 16.11.2020.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    var size: CGFloat
    var spacing: CGFloat
    var isEditable: Bool
    
    init(rating: Binding<Int>, size: CGFloat = 18, spacing: CGFloat = 5, isEditable: Bool = false) {
        self._rating = rating
        self.size = size
        self.spacing = spacing
        self.isEditable = isEditable
        
    }
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<5) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: size, height: size)
                    .foregroundColor(index < rating ? .yellow : Color("lightestGrey"))
                    .onTapGesture {
                        if isEditable {
                            self.rating = index + 1
                        }
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3), size: 25)
    }
}
