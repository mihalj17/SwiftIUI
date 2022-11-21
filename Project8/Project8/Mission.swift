//
//  Mission.swift
//  Project8
//
//  Created by Matko Mihaljl on 14.09.2022..
//

import Foundation




struct Mission: Codable,Identifiable{
    struct CrewRole: Codable{
        let name: String
        let role: String
        
    }
    
    let id: Int
    let launchDate : Date?
    let crew: [CrewRole]
    let description: String
    
    
    var displayName: String{
        "apollo\(id)"
    }
    
    var image: String{
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}


