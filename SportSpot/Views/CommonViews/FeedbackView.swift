//
//  FeedbackView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 16.11.2020.
//

import SwiftUI

struct FeedbackView: View {
    
    @State var rating = 3
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                AtlethIconSmall(isOnline: true)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("Александр Петров")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    RatingView(rating: $rating, size: 18)
                    
                }
                
                Spacer()
                
                Text("13 авг")
                    .font(.subheadline)
                    .foregroundColor(.captionGrey)

            }
            
            Text("Многофункциональная спортивная площадка представляет собой комплекс сооружений, включающий крытую универсальную спортивную площадку размером 60х30 метров, огороженную хоккейными бортами,")
                .font(.subheadline)
                .lineSpacing(4)
                .foregroundColor(.captionGrey)
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
