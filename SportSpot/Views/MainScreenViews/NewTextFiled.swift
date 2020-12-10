//
//  NewTextFiled.swift
//  SportSpot
//
//  Created by Денис Мусатов on 10.11.2020.
//

import SwiftUI

struct NewTextFiled<Content: View>: View {
    
    var placeholder: Content
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    init(_ placeholder: Content, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text)
                .foregroundColor(.black)
                
                
        }
    }
}


