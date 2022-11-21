//
//  Project11App.swift
//  Project11
//
//  Created by Matko Mihaljl on 20.09.2022..
//

import SwiftUI

@main
struct Project11App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
