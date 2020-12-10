//
//  CardsModels.swift
//  SportSpot
//
//  Created by Денис Мусатов on 20.11.2020.
//

import Foundation

struct Property: Hashable {
    var key: String
    var value: String
    
    init() {
        key = ""
        value = ""
    }
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}
