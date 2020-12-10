//
//  InputCard.swift
//  SportSpot
//
//  Created by Денис Мусатов on 19.11.2020.
//

import SwiftUI

struct InputTextCard: View {
    
    let placeholder: String
    let height: CGFloat
    @Binding var inputText: String
    
    init(_ placeholder: String, height: CGFloat, inputText: Binding<String>) {
        self.placeholder = placeholder
        self.height = height
        self._inputText = inputText
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
           
            Text(placeholder)
                .padding(.top, 7)
                .foregroundColor(.captionGrey)
                .font(.system(size: 12))
            MultiTextField(text: $inputText)
            
            
        }.padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .height(height)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.gray.opacity(0.2), radius: 15, x: 0, y: 0)
        
    }
}

struct InputCard_Previews: PreviewProvider {
    static var previews: some View {
        InputTextCard("Mem", height: 54, inputText: .constant("123"))
    }
}
