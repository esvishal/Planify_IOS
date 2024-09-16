//
//  PlanifyView.swift
//  Planify
//
//  Created by Student on 26/04/24.
//

import SwiftUI

struct PlanifyView: View {
    
    @StateObject var ViewModel = PlanifyViewModel()
    @State var shouldAddTask: Bool = false
    
    var body: some View {
        NavigationView{
            List {
                ForEach(ViewModel.items)
                {
                    item in
                    Text(item.taskName)
                }
            }.navigationTitle("PLANIFY VIEW")
                .navigationBarItems(trailing:Button("ADD"){
                        shouldAddTask = true
                }).sheet(isPresented: $shouldAddTask, content: {
                    PlanifyAddView(ViewModel: ViewModel)
                })
        }.preferredColorScheme(.dark)
    }
}

struct AddButton: View{
    var body: some View{
        Button("Add"){
            print("Add Task")
        }
    }
}
#Preview {
    PlanifyView()
}
