//
//  PointModel.swift
//  SportSpot
//
//  Created by Денис Мусатов on 23.11.2020.
//

import Mapbox

class Point: MGLPointFeature, Codable {
    
    let id: Int
    let address: String
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    init(latitude: Double, longitude: Double, id: Int) {
        self.id = id
        self.address = ""
        super.init()
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.identifier = id
        
    }
    
    enum CodingKeys: CodingKey {
        case id, address, longitude, latitude
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.coordinate.latitude, forKey: .latitude)
        try container.encode(self.coordinate.longitude, forKey: .longitude)
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.address = try container.decode(String.self, forKey: .address)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        super.init()
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.identifier = try container.decode(Int.self, forKey: .id)
        
    }
}
