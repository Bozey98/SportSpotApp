//
//  FeedbacksListView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 17.11.2020.
//

import SwiftUI

struct FeedbacksListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                }.buttonStyle(HeaderButtonStyle())
                
                
                
                HStack {
                    Text("Отзывы по площадке")
                        .bold()
                        .font(.system(size: 23))
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    Button(action: {}) {
                        ZStack {
                            Circle()
                                .foregroundColor(.skyBlue)
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                        }.frame(width: 44 ,height: 44)
                    }
                }
                
                HStack(spacing: 20) {
                    Text("Сортировать по:")
                        .foregroundColor(.captionGrey)
                        .opacity(0.5)
                        .font(.system(size: 14))
                    HStack(alignment: .center) {
                        Text("дате")
                            .foregroundColor(.skyBlue)
                            .font(.system(size: 14))
                        
                        VStack(alignment: .center,spacing: 2) {
                            Image(systemName: "triangle.fill")
                                .resizable()
                                .frame(width: 9, height: 5)
                                .foregroundColor(.skyBlue)
                                .opacity(0.3)
                            Image(systemName: "triangle.fill")
                                .resizable()
                                .frame(width: 9, height: 5)
                                .rotationEffect(Angle.degrees(180))
                                .foregroundColor(.skyBlue)
                        }.offset(y: 1.5)
                        
                    }
                    
                    HStack(alignment: .center) {
                        Text("оценке")
                            .foregroundColor(.captionGrey)
                            .font(.system(size: 14))
                        
                        VStack(alignment: .center,spacing: 2) {
                            Image(systemName: "triangle.fill")
                                .resizable()
                                .frame(width: 9, height: 5)
                                .foregroundColor(.captionGrey)
                                .opacity(0.3)
                            Image(systemName: "triangle.fill")
                                .resizable()
                                .frame(width: 9, height: 5)
                                .rotationEffect(Angle.degrees(180))
                                .foregroundColor(.captionGrey)
                                .opacity(0.3)
                        }.offset(y: 1.5)
                        
                    }
                }
                
                VStack {
                    ForEach(0..<10) { index in
                        FeedbackView()
                            .padding(.vertical)
                    }
                }
                
                
                
            }
            .padding(.horizontal, 24)
            
            //.padding(.top, 35)
            
            //.background(Color.backgroundColor)
            
        }
        .hideBar()
        .background(Color.backgroundColor.edgesIgnoringSafeArea(.all))
        
       
        
        
    }
}

struct FeedbacksListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbacksListView()
    }
}

