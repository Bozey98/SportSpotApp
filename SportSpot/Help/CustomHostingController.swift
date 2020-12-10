//
//  CustomHostingController.swift
//  SportSpot
//
//  Created by Денис Мусатов on 10.11.2020.
//

import SwiftUI

class HostingController<ContentView>: UIHostingController<ContentView> where ContentView : View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
