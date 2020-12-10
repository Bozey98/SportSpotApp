//
//  SheetView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 23.11.2020.
//

import SwiftUI

struct SheetView<SheetContent: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    let sheetContent: SheetContent
    
    @State private var dragOffset: CGFloat = .zero
    
    init(isPresented: Binding<Bool>, @ViewBuilder sheetContent: () -> SheetContent) {
        self._isPresented = isPresented
        self.sheetContent = sheetContent()
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isPresented)
                .zIndex(0)
              
            if isPresented {
                  
                sheetContent
                    .layoutPriority(10)
                    .zIndex(1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .transition(.move(edge: .bottom))
                    .offset(y: UIScreen.main.bounds.height / 20 + dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { drag in
                                if drag.translation.height > .zero {
                                    self.dragOffset = drag.translation.height
                                }
                            }
                            .onEnded { drag in
                                withAnimation {
                                    if self.dragOffset > UIScreen.main.bounds.height / 2.5 {
                                        self.isPresented = false
                                    }
                                    self.dragOffset = .zero
                                }
                            }
                    
                    )
                    .shadow(color: Color.gray.opacity(0.3), radius: 20, x: 0, y: -20)
                
            }
        }
    }
}


extension View {
    func sheetView<SheetContent: View>(isPresented: Binding<Bool>, @ViewBuilder sheetContent: () -> SheetContent) -> some View {
        self.modifier(SheetView(isPresented: isPresented, sheetContent: sheetContent))
    }
}
