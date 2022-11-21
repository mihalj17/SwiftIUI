//
//  addView.swift
//  Consolidation7-9
//
//  Created by Matko Mihaljl on 15.09.2022..
//

import SwiftUI

struct addView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habits: Habits
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add Activity")
            .navigationBarItems(trailing: Button("Save"){
                let habit = HabitsItem(title: self.title, description: self.description)
                self.habits.add(habits: habit)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct addView_Previews: PreviewProvider {
    static var previews: some View {
        addView(habits: Habits())
    }
}
