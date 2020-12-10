//
//  MainTabView.swift
//  TestEnv
//
//  Created by Денис Мусатов on 09.11.2020.
//

import SwiftUI


fileprivate class TabViewModel: ObservableObject {
    
    @Published fileprivate var current: Int
    
    fileprivate var views: [AnyView]
    
    let footers = ["Главная","Карта","Ивенты","Аккаунт"]
    let images = ["Homesvg","Mapsvg","Trophysvg","Profilesvg"]
    let imagesActive = ["HomesvgTap","MapsvgTap","TrophysvgTap","ProfilesvgTap"]
    
    var currentView: AnyView {
        views[current]
    }
    
    func iconImage(for index: Int) -> String {
        current == index ? imagesActive[index] : images[index]
    }
    
    func fontColor(for index: Int) -> Color {
        current == index ? Color("skyBlue") : Color("captionColor")
    }
    
    init<A:View, B: View, C: View, D: View> (views: TupleView<(A,B,C,D)>) {
        self.views = [AnyView(views.value.0), AnyView(views.value.1), AnyView(views.value.2), AnyView(views.value.3)]
        self.current = 0
    }
    
    func item(for index: Int) -> AnyView {
        return AnyView(
            VStack {
                Image(iconImage(for: index))
                    .resizable()
                    .frame(width: iconSize.width, height: iconSize.height)
                Text(footers[index])
                    .font(.caption)
                    .foregroundColor(fontColor(for: index))
                    .offset(y: current == index ? 4 : 0)
            }
        )
    }
    
    let iconSize = CGSize(width: 20, height: 20)
    
}



struct MainTabView: View {

    @ObservedObject private var tabViewModel: TabViewModel
    
    init<A:View, B: View, C: View, D: View>(@ViewBuilder content: () -> TupleView<(A,B,C,D)>) {
        tabViewModel = TabViewModel(views: content())
    }
    
    var body: some View {
        ZStack {
        
            VStack {
                tabViewModel.currentView
                    .frame(height: screenHeight - tabBarHeight + cornerRadius)
                    
                
                    
                Spacer()
            }
            
            VStack {
                Spacer()
                ZStack(alignment: .top) {
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .shadow(color: Color.gray.opacity(0.25), radius: 10.0, x: 0, y: 0)
                        .foregroundColor(.white)
                    
                    HStack(alignment: .top) {
                        ForEach(0..<tabViewModel.views.count) { index in
                            Spacer()
                            tabViewModel.item(for: index)
                                .padding(.top, itemsPadding)
                                .onTapGesture { withAnimation(Animation.easeInOut(duration: 0.2)) { self.tabViewModel.current = index } }
                            Spacer()
                        }
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: tabBarHeight)
            }
        }.edgesIgnoringSafeArea(.all)
        
        
        

        
    }
    
    //MARK: Sizes
    
    let screenHeight = UIScreen.main.bounds.height
    let tabBarHeight = UIScreen.main.bounds.height / 9.78
    let itemsPadding = UIScreen.main.bounds.height / 9.78 / 6
    
    let cornerRadius: CGFloat = 20
    
}
