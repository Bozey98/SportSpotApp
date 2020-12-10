//
//  PointsViewModel.swift
//  SportSpot
//
//  Created by Денис Мусатов on 23.11.2020.
//

import SwiftUI
import Combine

class PointsViewModel: ObservableObject {
    @Published var points: [Point] = []
    var subscriber: AnyCancellable?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        if let url = URL(string: "https://geoloader.hdrd.ru/api/playgrounds/map") {
            let request = URLRequest(url: url)
            self.subscriber = URLSession.shared.dataTaskPublisher(for: request)
                .map { $0.data}
                .decode(type: CodableData.self, decoder: JSONDecoder())
                .map { $0.data}
                .replaceError(with: [])
                .receive(on: DispatchQueue.main)
                .assign(to: \.points, on: self)
                
            
        }
    }
}

struct CodableData: Codable {
    var data: [Point]
}
