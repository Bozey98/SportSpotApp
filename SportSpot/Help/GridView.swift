//
//  GridView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 20.11.2020.
//

import SwiftUI

struct GridView<Content: View, Item: Hashable>: View {
    
    var content: (Item) -> Content
    var items: [[Item]]
    var spacing: CGFloat
    
    init(_ items: [Item], columns: Int, spacing: CGFloat = 20, content: @escaping (Item) -> Content) {
        self.items = items.chunked(into: columns)
        self.content = content
        self.spacing = spacing
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(0..<items.count) {row in
                HStack(alignment: .top, spacing: spacing) {
                    ForEach(items[row], id: \.self ) { item in
          
                        content(item)
                        
                    }
                }
            }
            
        }
    }
}









