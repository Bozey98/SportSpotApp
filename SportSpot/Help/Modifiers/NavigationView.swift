//
//  NavigationView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 18.11.2020.
//

import SwiftUI

struct NavigationModifier: ViewModifier {
    func body(content: Content) -> some View {
        NavigationView {
            content
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct HidenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
            content
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
        
    }
}

extension View {
    func navigationView() -> some View {
        self.modifier(NavigationModifier())
    }
}

extension View {
    func hideBar() -> some View {
        self.modifier(HidenNavigationBar())
            
            //.navigationBarBackButtonHidden(true)
    }
}
