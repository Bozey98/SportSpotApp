//
//  View.swift
//  SportSpot
//
//  Created by Денис Мусатов on 17.11.2020.
//

import SwiftUI

extension View {
    func height(_ height: CGFloat) -> some View {
        self.frame(height: height)
    }
    
    func hideKeyboard() -> some View {
        self.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}
