//
//  ButtonStyles.swift
//  GdePotrnenitProject
//
//  Created by Денис Мусатов on 18.08.2020.
//  Copyright © 2020 Денис Мусатов. All rights reserved.
//

import SwiftUI

struct AddButtonSyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .font(.title)
            .clipShape(Circle())
            .scaleEffect( configuration.isPressed ? 0.9 : 1)
            .animation(Animation.easeInOut(duration: 0.5))
    }
    
}

struct NextButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .frame(width: 100, height: 50)
            configuration.label
                .foregroundColor(.white)
                
        }
        .padding(.horizontal, 9)
        .scaleEffect( configuration.isPressed ? 0.9 : 1)
        .animation(Animation.easeInOut(duration: 0.5))
    }
    
}

struct DisabledNextButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
                .frame(width: 100, height: 50)
            configuration.label
                .foregroundColor(.white)
                
        }.opacity(0.7)
        .padding(.horizontal, 9)
        .scaleEffect( configuration.isPressed ? 0.9 : 1)
        .animation(Animation.easeInOut(duration: 0.5))
    }
    
}

struct TapStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 54, height: 54)
            .scaleEffect( configuration.isPressed ? 0.85 : 1)
            .animation(Animation.easeInOut(duration: 0.5))
        
    }
    
}

struct HeaderButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            configuration.label
        }
        .frame(width: 44, height: 44)
        .scaleEffect( configuration.isPressed ? 0.85 : 1)
        .shadow(color: Color.gray.opacity(configuration.isPressed ? 0.35 : 0.25), radius: configuration.isPressed ? 20.0 : 15.0, x: 0, y: 0)
        .animation(Animation.easeInOut(duration: 0.5))
        .padding(.vertical, 10)
        
    }
    
    
    
}

struct TabViewStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect( configuration.isPressed ? 0.9 : 1)
            .animation(Animation.easeInOut(duration: 0.5))
            .transition(.scale)
    }
    
}


