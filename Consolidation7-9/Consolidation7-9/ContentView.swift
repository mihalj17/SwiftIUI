//
//  ContentView.swift
//  Consolidation7-9
//
//  Created by Matko Mihaljl on 15.09.2022..
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State var showAddActivity = false
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(habits.habitItems) {
                    habits in
                    NavigationLink(destination: editView(habits: self.habits, activityId: habits.id)){
                        VStack(alignment: .leading){
                            Text(habits.title)
                                .font(.subheadline)
                            Text(habits.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack{
                                Text("Completed")
                                Text("\(habits.completedTimes)")
                                    .padding(.horizontal)
                                    .foregroundColor(habits.completedTimes > 0 ? .green : .red)
                                Text("times")
                            }
                            .font(.subheadline)
                        }
                    }
                }
                .onDelete{ offsets in
                    self.habits.habitItems.remove(atOffsets: offsets)
                }
            }
            .navigationBarTitle("Habits")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showAddActivity = true
            })
                                {
                Image(systemName: "plus")
                    .frame(width: 44, height: 44)
            })
        }
        .sheet(isPresented: $showAddActivity){
            addView(habits: self.habits)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
