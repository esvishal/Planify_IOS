//
//  PlanifyAddView.swift
//  Planify
//
//  Created by Student on 26/04/24.
//

import SwiftUI

struct PlanifyAddView: View{
    @State var title: String = ""
    @State var dueDate: Date = Date()
    @State var priority: PlanifyModel.Priority = .high
    @State var status: PlanifyModel.Status = .complete
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var ViewModel: PlanifyViewModel
    
    var body: some View{
        NavigationView {
            Form {
                Section(header: Text("Title")){
                    TextField("Enter title:", text:$title)
                }
                
                Section(header: Text("Due date")){
                    DatePicker("Select Due Date", selection: $dueDate,displayedComponents: .date)
                }
                
                Section(header: Text("Priority")){
                    Picker("Select Priority", selection: $priority){
                        ForEach(PlanifyModel.Priority.allCases, id:\.self){ priority in
                            Text(priority.rawValue.capitalized)}
                    }
                }
                
                Section(header: Text("Status")){
                    Picker("Select Status", selection: $status){
                        ForEach(PlanifyModel.Status.allCases, id:\.self){ Status in
                            Text(Status.rawValue.capitalized)}
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
            }.navigationTitle("PLANIFY ADD")
                .navigationBarItems(trailing:Button("SAVE"){
                let model =  PlanifyModel(taskName: title,
                                          dueDate: dueDate,
                                          status: status,
                                          priority: priority)
                ViewModel.addItem(model)
                presentationMode.wrappedValue.dismiss()
                })
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    PlanifyAddView(ViewModel: PlanifyViewModel())
}
