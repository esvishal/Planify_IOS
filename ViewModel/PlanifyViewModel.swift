//
//  PlanifyViewModel.swift
//  Planify
//
//  Created by Student on 26/04/24.
//

import Foundation

class PlanifyViewModel: ObservableObject{
    @Published var items: [PlanifyModel] = [PlanifyModel]()
    
    func addItem(_ item: PlanifyModel){
        items.append(item)
    }
    
    func deleteItem(_ index: Int){
        items.remove(at: index)
    }
    
    func updateItem(){
        
    }
}
