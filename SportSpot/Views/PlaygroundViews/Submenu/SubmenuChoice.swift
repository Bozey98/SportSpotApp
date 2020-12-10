//
//  TestSubmenu.swift
//  SportSpot
//
//  Created by Денис Мусатов on 15.11.2020.
//

import SwiftUI

struct SubmenuChoice: View {
    
    let buttons = ["О площадке","Ивенты","Спорстмены"]
    
    @Binding var currentView: Int
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                ForEach(0..<buttons.count) { index in
                    
                    
                    Button(action: { withAnimation { currentView = index } }) {
                        VStack(spacing: 10) {
                            Text(buttons[index])
                                .fontWeight(currentView == index ? .medium : .regular)
                                .foregroundColor(currentView == index ? Color("skyBlue") : Color("captionColor"))
                            
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundColor(currentView == index ? Color("skyBlue") : .white)
                                .frame(height: 4)
                                .offset(y: 1)
                                
                        }
                    }.buttonStyle(DefaulStyle())
  
                }
                
            }.padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(Color("lightestGrey"))
        }
    }
}

struct TestSubmenu_Previews: PreviewProvider {
    static var previews: some View {
        SubmenuChoice(currentView: .constant(0))
    }
}

struct DefaulStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
