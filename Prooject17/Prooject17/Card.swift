//
//  Card.swift
//  Prooject17
//
//  Created by Matko Mihaljl on 04.10.2022..
//

import Foundation


struct Card: Codable {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
