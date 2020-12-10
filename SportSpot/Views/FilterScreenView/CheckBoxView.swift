//
//  CheckBoxView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 06.12.2020.
//

import SwiftUI

struct CheckBoxView: View {
    
    var label: String
    @Binding var picked: Bool
    
    init(_ label: String, picked: Binding<Bool>) {
        self.label = label
        self._picked = picked
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(picked ? .skyBlue : .white)
                    .frame(width: 25, height: 25)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.checkboxBorder, lineWidth: 1))
                if picked {
                    Image(systemName: "checkmark")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                        
                }
            }
            
            Text(label)
                .foregroundColor(picked ? .black : .captionGrey)
                .font(.system(size: 14))
        }.onTapGesture {
            withAnimation(Animation.easeIn(duration: 0.2)) {
                picked.toggle()
            }
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView("Открытые сейчас", picked: .constant(true))
    }
}
