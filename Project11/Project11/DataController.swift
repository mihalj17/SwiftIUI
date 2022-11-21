//
//  DataController.swift
//  Project11
//
//  Created by Matko Mihaljl on 20.09.2022..
//

import CoreData
import Foundation


class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Bookworm")
    
    init(){
        container.loadPersistentStores{
            description, error in
            if let error = error {
                 print("Core data faiilet to load: \(error.localizedDescription)")
            }
           
        }
    }
    
    
    
}
