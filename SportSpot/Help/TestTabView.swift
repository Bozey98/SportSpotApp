//
//  MainTabView.swift
//  TestEnv
//
//  Created by Денис Мусатов on 09.11.2020.
//

import SwiftUI


class TestTabViewModel: ObservableObject {
    
    @Published var current: Int
    
    fileprivate var views: [AnyView]
    
    fileprivate let footers = ["Главная","Карта","Ивенты","Аккаунт"]
    fileprivate let images = ["Homesvg","Mapsvg","Trophysvg","Profilesvg"]
    fileprivate let imagesActive = ["HomesvgTap","MapsvgTap","TrophysvgTap","ProfilesvgTap"]
    
    fileprivate var currentView: AnyView {
        views[current]
    }
    
    fileprivate func iconImage(for index: Int) -> String {
        current == index ? imagesActive[index] : images[index]
    }
    
    fileprivate func fontColor(for index: Int) -> Color {
        current == index ? Color("skyBlue") : Color("captionColor")
    }
    
    fileprivate init<A:View, B: View, C: View, D: View> (views: TupleView<(A,B,C,D)>) {
        self.views = [AnyView(views.value.0), AnyView(views.value.1), AnyView(views.value.2), AnyView(views.value.3)]
        self.current = 0
    }
    
    fileprivate func item(for index: Int) -> AnyView {
        return AnyView(
            VStack {
                Image(iconImage(for: index))
                    .resizable()
                    .frame(width: iconSize.width, height: iconSize.height)
                Text(footers[index])
                    .font(.caption)
                    .foregroundColor(fontColor(for: index))
                    //.offset(y: current == index ? 4 : 0)
            }
        )
    }
    
    let iconSize = CGSize(width: 20, height: 20)
    
}



struct TestMainTabView: View {

    @ObservedObject var tabViewModel: TestTabViewModel
    @ObservedObject var showModals: AppContext
    
    
    init<A:View, B: View, C: View, D: View>(@ViewBuilder content: () -> TupleView<(A,B,C,D)>) {
        tabViewModel = TestTabViewModel(views: content())
        showModals = AppContext()
        print("reloaded")
    }
    
    var body: some View {
        VStack(spacing: 0) {
        
            
                tabViewModel.currentView
                    .frame(maxHeight: .infinity)
                    .offset(y: cornerRadius)
              
                ZStack(alignment: .top) {
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .shadow(color: Color.gray.opacity(0.25), radius: 10.0, x: 0, y: 0)
                        .foregroundColor(.white)
                    
                    HStack(alignment: .top) {
                        ForEach(0..<tabViewModel.views.count) { index in
                            Spacer()
                            Button(action: { self.tabViewModel.current = index }, label: { tabViewModel.item(for: index)} )
                                .buttonStyle(TabViewStyle())
                                .padding(.top, itemsPadding)
                            Spacer()
                        }
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: tabBarHeight)
            
        }
        .edgesIgnoringSafeArea(.all)
        .environmentObject(showModals)
        .environmentObject(tabViewModel)
        .sheetView(isPresented: $showModals.showPlayground) {
            PlaygroundView()
        }
        
        
        
        
        
        
        

        
    }
    
    //MARK: Sizes
    
    let screenHeight = UIScreen.main.bounds.height
    let tabBarHeight = UIScreen.main.bounds.height / 9.78
    let itemsPadding = UIScreen.main.bounds.height / 9.78 / 6
    
    let cornerRadius: CGFloat = 20
    
}
