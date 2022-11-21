//
//  Facility.swift
//  Project19
//
//  Created by Matko Mihaljl on 11.10.2022..
//

import Foundation
import SwiftUI


struct Facility: Identifiable {
    let id = UUID()
    var  name: String
    
    private let icons = [
        "Accmmodation": "house",
        "Beginners": "1.circle",
        "Cross-country": "map",
        "Eco-friendly": "leaf.arrow.circepath",
        "Family": "person.3"
    ]
    
    private let descriptions = [
        "Accmmodation": "house",
        "Beginners": "1.circle",
        "Cross-country": "This resort has many cross-coutry",
        "Eco-friendly": "This resprt has wpn an award for environmental friendliness",
        "Family": "This resort is popular with families"
    ]
    var icon: some View {
        if let iconName = icons[name]{
            return Image(systemName: iconName)
                .accessibilityLabel(name)
                .foregroundColor(.secondary)
        } else {
         fatalError("Unknwown faacility type: \(name)")
        }
    }
    
    
    var description: String {
        if let message = descriptions[name]{
            return message
        } else {
         fatalError("Unknwown faacility type: \(name)")
        }
    }
}
