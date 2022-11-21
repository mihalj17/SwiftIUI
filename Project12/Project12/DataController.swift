//
//  DataController.swift
//  Project12
//
//  Created by Matko Mihaljl on 22.09.2022..
//




import CoreData
import Foundation


class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Wizard")
    
    init(){
        container.loadPersistentStores{
            description, error in
            if let error = error {
                 print("Core data faiilet to load: \(error.localizedDescription)")
            }
           
        }
    }
    
    
    
}
