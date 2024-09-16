//
//  PlanifyModel.swift
//  Planify
//
//  Created by Student on 26/04/24.
//

import Foundation

struct PlanifyModel: Identifiable {
    var taskName: String
    var dueDate: Date
    var status: Status
    var priority: Priority
    var id: UUID = UUID()

    enum Status : String, CaseIterable
    {
        case complete = "Completed"
        case incomplete = "Incompleted"
    }
    
    
    enum Priority : String, CaseIterable
    {
        case high = "High"
        case low = "Low"
        case medium = "Medium"
    }
}
