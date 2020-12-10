//
//  SignUpView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 28.11.2020.
//

import SwiftUI

struct SignUpView: View {
    
    @State var number = ""
    
    var placeholder: some View {
        Text("(000) 000-00-00")
            .foregroundColor(.captionGrey)
            .opacity(0.3)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            GeometryReader { geo in
                Image("signupBG")
                    .resizable()

                    .height(geo.size.height + 50)
                Image("signupImage")
                    .resizable()
                    .scaledToFill()
                    .offset(y: 30)
                    
                    
            }

            VStack(alignment: .leading, spacing: 35) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Укажите номер вашего телефона")
                        .foregroundColor(.black)
                        .font(.system(size: 23))
                        .bold()
                    Text("Мы отправили вам СМС с кодом для входа")
                        .font(.system(size: 16))
                        .foregroundColor(.captionGrey)
                }.padding(.top, 25)
                    

                HStack {
                    Text("+7")
                    NewTextFiled(placeholder, text: $number)
                        .keyboardType(.numberPad)
                        
                    
                }.font(.system(size: 24))
                
                
                VStack {
                    HStack(spacing: 20) {
                        RoundedRectangle(cornerRadius: 1).height(1)
                            .foregroundColor(.dividerBG)
                        Text("или")
                            .font(.system(size: 14))
                            .foregroundColor(.dividerText)
                        RoundedRectangle(cornerRadius: 1).height(1)
                            .foregroundColor(.dividerBG)
                    }
                    
                    HStack(alignment: .bottom,spacing: 45) {
                     
                        ForEach(socialButtons, id: \.self) { button in
                            Image(button)
                        }
                     
                    }
                }
                
                
                
                
                
                Spacer()
                
                VStack(spacing: 20) {
                    Button(action: {}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 33)
                                .foregroundColor(.skyBlue)
                            Text("Выслать код")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }.frame(height: 54)
                    }
                    
                    Group {
                        Text("При входе вы cоглашаетесь c ") +
                        Text("пользовательским соглашением").foregroundColor(.skyBlue) +
                        Text(" и ") +
                        Text("обработкой персональных данных")
                            .foregroundColor(.skyBlue)
                            
                    }
                    .foregroundColor(.captionGrey)
                    .font(.system(size: 14))
                        .frame(maxHeight: .infinity)
                }
                
                
                
                
            }
            
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
            .height(UIScreen.main.bounds.height / 1.75)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .offset(y: 25)
            
            
            
            
            
            
        }
        .edgesIgnoringSafeArea(.top)
        .hideKeyboard()
    }
    
    let socialButtons = ["appleIcon","vkIcon","facebookIcon","googleIcon"]
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
