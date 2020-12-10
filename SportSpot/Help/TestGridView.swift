//
//  TestGridView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 20.11.2020.
//

import SwiftUI

struct TestGridView: View {
    
    let properties = [Property(key: "Качество", value: "Новая"), Property(key: "Покрытие", value: "Резиновое"), Property(key: "Освещение", value: "Светодиодное"), Property(key: "Тип", value: "Крытая площадка"), Property(key: "Раздевалка", value: "Есть"), Property(key: "Душ", value: "есть"), Property(key: "Инвентарь", value: "4 футбольных мяча")]
    
    var body: some View {
        GridView(properties, columns: 2) { property in
            PropertyCard(property: property)
        }
    }
}

struct TestGridView_Previews: PreviewProvider {
    static var previews: some View {
        TestGridView()
    }
}
