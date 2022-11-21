//
//  Habits.swift
//  Consolidation7-9
//
//  Created by Matko Mihaljl on 15.09.2022..
//

import Foundation


class Habits: ObservableObject {
    
    @Published var habitItems = [HabitsItem]() {
        
        didSet {
            if let encoded = try? JSONEncoder().encode(habitItems){
                UserDefaults.standard.set(encoded, forKey: "habits")
            }
        }
    }
    
    init(){
        if let encoded = UserDefaults.standard.data(forKey: "habits"){
            if let decoded = try? JSONDecoder().decode([HabitsItem].self, from: encoded){
                self.habitItems = decoded
                
                return
            }
        }
        self.habitItems = []
    }
    private func getIndex(habitsItem: HabitsItem) -> Int?{
        return habitItems.firstIndex(where: {$0.id == habitsItem.id})
        
    }
    private func getIndex(id: UUID) -> Int?{
        return habitItems.firstIndex(where: {$0.id == id})
    }
    
    func getHabit(id: UUID) -> HabitsItem {
        guard let index = getIndex(id: id) else {
            return HabitsItem(title: "", description: "")
        }
        return habitItems[index]
    }
    
    func update(habitsItem: HabitsItem){
        guard let index = getIndex(habitsItem: habitsItem) else {return}
        
        habitItems[index] = habitsItem
        
    }
    
    func add(habits: HabitsItem){
        habitItems.append(habits)
    }
}
