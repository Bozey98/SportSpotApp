//
//  TestPicker.swift
//  SportSpot
//
//  Created by Денис Мусатов on 21.11.2020.
//

import SwiftUI

struct InputPickerCard: View {
    
    let title: String
    let content: [String]
    
    @Binding var pickedValue: Int
    @State private var showPicker = false
    
    init(_ title: String, pickedValue: Binding<Int>, content: [String]) {
        self.title = title
        self.content = content
        self._pickedValue = pickedValue
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                   
                    HStack {
                        Text(title)
                            .padding(.top, 7)
                            .foregroundColor(.captionGrey)
                            .font(.system(size: 12))
                    }
                    Text(content[pickedValue])
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        
                    Spacer()
                    
                    
                }
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.black)
                    .rotation3DEffect(
                        showPicker ? Angle.degrees(180) : .zero,
                        axis: (x: 1, y: 0, z: 0)
                    )
                   
            }
            .zIndex(1)
            .padding(.horizontal, 20)
            .height(54)
            
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: showPicker ? 0 : 12))
            .shadow(color: Color.gray.opacity(0.1), radius: 15, x: 0, y: 10)
            .onTapGesture {
                withAnimation {
                    showPicker.toggle()
                }
            }
            
            
            if showPicker {
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(0..<content.count) { index in
                            HStack {
                                Text(content[index])
                                    .foregroundColor(.captionGrey)
                                Spacer()
                                if index == pickedValue {
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.skyBlue)
                                }
                                
                            }
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .onTapGesture {
                                self.pickedValue = index
                                withAnimation {
                                    self.showPicker = false
                                }
                            }
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                }
                .zIndex(0)
                .frame(maxHeight: 150)
                .background(Color.white)
                .transition(AnyTransition.move(edge: .top))
            }
            
            
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.gray.opacity(0.2), radius: 15, x: 0, y: 0)

    }
}

struct TestPicker_Previews: PreviewProvider {
    static var previews: some View {
        InputPickerCard("Piker",pickedValue: .constant(1), content: ["Good Picker","Best Picker","Great Picker"])
    }
}
