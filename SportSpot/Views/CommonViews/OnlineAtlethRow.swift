//
//  OnlineAtlethRow.swift
//  SportSpot
//
//  Created by Денис Мусатов on 10.11.2020.
//

import SwiftUI

struct OnlineAtlethRow: View {
    
    var subtitle: String?
    var address: String?
    var showArrow: Bool
    @State var isOnline: Bool
    
    
    init(isOnline: Bool, subtitle: String?, showArrow: Bool = true) {
        _isOnline = State(initialValue: isOnline)
        self.subtitle = subtitle
        self.address = nil
        self.showArrow = showArrow
    }
    
    init(isOnline: Bool, address: String?, showArrow: Bool = true) {
        _isOnline = State(initialValue: isOnline)
        self.address = address
        self.subtitle = nil
        self.showArrow = showArrow
    }
    
    init(isOnline: Bool, showArrow: Bool = true) {
        _isOnline = State(initialValue: isOnline)
        self.address = nil
        self.subtitle = nil
        self.showArrow = showArrow
    }
    

    
    var body: some View {
        HStack {
            AtlethIconSmall(isOnline: isOnline)
            
            VStack(alignment: .leading, spacing: 7) {
                Text("Алиса Шмидт")
                    .bold()
                    .foregroundColor(.black)
                    .font(.subheadline)
                
                if let address = address {
                    HStack {
                        Image("pinMain")
                        Text(address)
                            .foregroundColor(Color("captionColor"))
                            .font(.footnote)
                    }
                }
                if let subtitle = subtitle {
                    Text(subtitle)
                        .foregroundColor(Color("captionColor"))
                        .font(.footnote)
                }
                
            }
            
            Spacer()
            if showArrow {
                Image(systemName: "chevron.right")
                    .font(.system(size: 24))
                    .foregroundColor(Color("captionColor"))
                    .opacity(0.6)
            }
        }
    }
}

struct OnlineAtlethRow_Previews: PreviewProvider {
    static var previews: some View {
        OnlineAtlethRow(isOnline: true, subtitle: "Мясницкий проспект 55")
    }
}
