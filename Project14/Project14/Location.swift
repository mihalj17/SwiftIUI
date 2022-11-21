//
//  Location.swift
//  Project14
//
//  Created by Matko Mihaljl on 29.09.2022..
//

import Foundation
import CoreLocation


struct Location: Identifiable, Codable, Equatable {
    
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
    }
    
    static let example = Location(id: UUID(), name: "Buuuckingham Palace", description: "Where Queen Elizabeth lives", latitude: 51.501, longitude: -0.141)
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
