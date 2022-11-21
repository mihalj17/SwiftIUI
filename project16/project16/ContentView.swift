//
//  ContentView.swift
//  project16
//
//  Created by Matko Mihaljl on 03.10.2022..
//

import SwiftUI
import UserNotifications
import SamplePackage

 
struct ContentView: View {
    @StateObject var prospects = Prospects()
var body: some View {
    TabView{
        ProspectsView(filter: .none)
            .tabItem{
                Label("Everyone", systemImage: "person.3")
            }
        ProspectsView(filter: .contacted)
            .tabItem{
                Label("Contacted", systemImage: "checkmaark.circle")
            }
        ProspectsView(filter: .uuncontacted)
            .tabItem{
                Label("Uncontacted", systemImage: "questionmark.diamond")
            }
        MeView()
            .tabItem{
                Label("Me", systemImage: "person.crop.square")
            }
    }
    .environmentObject(prospects)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
