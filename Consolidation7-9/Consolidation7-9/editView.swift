//
//  editView.swift
//  Consolidation7-9
//
//  Created by Matko Mihaljl on 15.09.2022..
//

import SwiftUI

struct editView: View {
    
    @ObservedObject var habits: Habits
    var activityId :UUID
    
    @State var completedTimes: Int = 0
    
    var habit: HabitsItem {
        habits.getHabit(id: activityId)
    }
    var body: some View {
        Form{
            Text(habit.title)
            Text(habit.description)
            Stepper(
                onIncrement: {self.updateActivity(by: 1)},
                onDecrement: {self.updateActivity(by: -1)},
                label: {Text("Completed \(habit.completedTimes)")}
                
                
            )}
        .navigationTitle("Edit Activity")
                
                
                }
                func updateActivity(by change: Int) {
                    var habit = self.habit
                    habit.completedTimes += change
                    self.habits.update(habitsItem: habit)
                }
                }
                
                struct editView_Previews: PreviewProvider {
                    static var previews: some View {
                        editView(habits: Habits(), activityId: UUID())
                    }
                }
