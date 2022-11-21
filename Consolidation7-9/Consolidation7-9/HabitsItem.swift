//
//  HabitsItem.swift
//  Consolidation7-9
//
//  Created by Matko Mihaljl on 15.09.2022..
//

import Foundation


struct HabitsItem: Identifiable, Codable {
    
    var date = Date()
    
    var id = UUID()
    
    var title: String
    var description: String
    
    var completedTimes: Int = 0 {
        didSet{
            date = Date()
            if completedTimes < 0 {
                completedTimes = 0
            }
        }
    }
    
    
    
    
}
