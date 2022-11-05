//
//  Location.swift
//  Challenge6
//
//  Created by Parsa Nasirimehr on 2022-11-05.
//

import Foundation
import MapKit

struct Location: Identifiable, Codable, Equatable, Hashable {
    var id: UUID
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(id: UUID(), latitude: 51.501, longitude: -0.141)
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    init(id: UUID, latitude: Double, longitude: Double) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(id: UUID, location: CLLocationCoordinate2D) {
        self.id = id
        self.latitude = location.latitude
        self.longitude = location.longitude
    }
}
