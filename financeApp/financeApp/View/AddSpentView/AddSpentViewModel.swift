//
//  AddSpentViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation

class AddSpentViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var type: SpentCategory = .other
    @Published var cost: String = ""
    @Published var date: Date = .now
    
    var context = CoreDataManager.shared.persistentStoreContainer.viewContext
    
    func addSpent(){
        let spent = Spent(context: context)
        spent.id = UUID()
        spent.date = date
        spent.cost = Double(cost) ?? 0
        spent.name = name
        spent.type = type.rawValue
        do{
            try spent.save()
        }catch{
            print(error.localizedDescription)
        }
    }
}
