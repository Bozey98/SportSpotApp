//
//  FilterView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 13.11.2020.
//

import SwiftUI

struct FilterView: View {
    
    @State private var addres = ""
    
    var placeholder: some View {
        Text("Введите адрес")
            .foregroundColor(.black)
            
            
    }
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                    .shadow(color: Color.gray.opacity(0.2), radius: 15.0, x: 0, y: 0)
                    
                NewTextFiled (placeholder, text: $addres)
                    .font(.footnote)
                    .padding(.leading)
                    .opacity(0.5)
                    
            }
            .frame(height: 54)
            
            Button(action: {}) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.darkBlue)
                    Image("filter")
                }
            }
            .buttonStyle(TapStyle())
            .padding(.leading, 10)
            
        }
            
            .padding(.top, 40)
            .padding([.leading, .trailing], 24)
            
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
