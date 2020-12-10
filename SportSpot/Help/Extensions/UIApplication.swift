//
//  UIApplication.swift
//  SportSpot
//
//  Created by Денис Мусатов on 28.11.2020.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
