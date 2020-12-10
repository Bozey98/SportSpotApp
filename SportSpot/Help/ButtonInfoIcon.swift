//
//  ButtonInfoIcon.swift
//  SportSpot
//
//  Created by Денис Мусатов on 18.11.2020.
//

import SwiftUI

struct ButtonInfoIcon: View {
    var body: some View {
        VStack(spacing: 3) {
            ForEach(0..<3) { _ in
                Circle()
                    .frame(width: 4, height: 4)
                    .foregroundColor(.black)
            }
        }
    }
}

struct ButtonInfoIcon_Previews: PreviewProvider {
    static var previews: some View {
        ButtonInfoIcon()
    }
}
