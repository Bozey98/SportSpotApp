//
//  CountPicker.swift
//  SportSpot
//
//  Created by Денис Мусатов on 20.11.2020.
//

import SwiftUI

struct CountPicker: View {
    
    @Binding var count: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.white)
                .shadow(color: Color.gray.opacity(0.25), radius: 15, x: 0, y: 0)
            HStack {
                Button(action: { if count > 1 { self.count -= 1} }) {
                    ZStack {
                        Circle()
                            .foregroundColor(.darkBlue)
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .medium))
                    }
                }.frame(width: 46, height: 46)
                
                
                Spacer()
                Text("\(count)")
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                Spacer()
                
                Button(action: {self.count += 1}) {
                    ZStack {
                        Circle()
                            .foregroundColor(.darkBlue)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .medium))
                    }
                }.frame(width: 46, height: 46)
                
            }.padding(.horizontal,4)
                
        }.frame(width: 151, height: 54)
    }
}

struct CountPicker_Previews: PreviewProvider {
    static var previews: some View {
        CountPicker(count: .constant(1))
    }
}
