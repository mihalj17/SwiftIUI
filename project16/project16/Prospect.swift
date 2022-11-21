//
//  Prospect.swift
//  project16
//
//  Created by Matko Mihaljl on 03.10.2022..
//

import SwiftUI


class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init(){
        people = []
    }
}
