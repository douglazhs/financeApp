//
//  AddSpentViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation
import CoreData
import SwiftUI

class AddSpentViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var type: SpentCategory = .unknown
    @Published var cost: String = ""
    @Published var date: Date = .now
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    /// Save spent on CoreData
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
    
    /// Hide keyboard when click at screen
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
