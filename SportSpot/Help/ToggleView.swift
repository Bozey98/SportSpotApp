//
//  ToggleView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 19.11.2020.
//

import SwiftUI

struct ToggleView: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30.0)
                .foregroundColor(.white)
                .shadow(color: Color.gray.opacity(0.3), radius: 15, x: 0, y: 0)
            HStack {
                if isOn {
                    Spacer()
                }
                ZStack {
                    Circle()
                        .frame(width: 21, height: 21)
                        .foregroundColor(isOn ? .blue : .red)
                        .padding(.horizontal, 2)
                    Image(systemName: isOn ? "checkmark" : "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 11, weight: .bold))
                }
                if !isOn {
                    Spacer()
                }
            }
        }
        .frame(width: 40, height: 24)
        .onTapGesture { withAnimation { isOn.toggle() } }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView(isOn: .constant(true))
    }
}
