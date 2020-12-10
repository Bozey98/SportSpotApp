//
//  MultiTextField.swift
//  NewTestProject
//
//  Created by Денис Мусатов on 19.11.2020.
//

import SwiftUI

struct MultiTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = true
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = .black
        textView.backgroundColor = .none
        textView.returnKeyType = .done
        textView.isSelectable = true
        
        textView.delegate = context.coordinator
        
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.showsHorizontalScrollIndicator = false
        textView.showsVerticalScrollIndicator = false
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultiTextField
        
        init(_ parent: MultiTextField) {
            self.parent = parent
        }

        func textViewDidEndEditing(_ textView: UITextView) {
            
            if let inputText = textView.text {
                self.parent.text = inputText
            }
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if text == "\n" {
                textView.resignFirstResponder()
                return false
            }
            return true
        }
        
        
    }
    
    
}

