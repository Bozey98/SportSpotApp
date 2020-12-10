//
//  SubmenuViews.swift
//  SportSpot
//
//  Created by Денис Мусатов on 15.11.2020.
//

import SwiftUI

struct SubmenuViews: View {
    
    @State var currentView = 0
    
    let views = [AnyView(AboutPlaygroundView()), AnyView(PlaygroundEventsView()), AnyView(PlaygroundAtlethsView())]
    
    var body: some View {
        VStack {
            SubmenuChoice(currentView: $currentView)
            views[currentView]
        }
    }
}

struct SubmenuViews_Previews: PreviewProvider {
    static var previews: some View {
        SubmenuViews()
    }
}


struct View1: View {
    var body: some View {
        Color.red
    }
}

struct View2: View {
    var body: some View {
        Color.green
    }
}

struct View3: View {
    var body: some View {
        Color.blue
    }
}
