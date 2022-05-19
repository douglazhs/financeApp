//
//  InitialViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 18/05/22.
//

import Foundation
import SwiftUI
import CoreData

class InitialViewModel: NSObject, ObservableObject{
    @Published var budget: String = ""
    @Published var user: User?
    @Published var spents: [Spent] = [Spent]()
    var dataManager: DataFetchable
    
    init(dataManager: DataFetchable){
        self.dataManager = dataManager
        super.init()
        fetchBudget()
    }
    
    func fetchBudget(){
        dataManager.fetchUser { user in
            withAnimation {
                self.user = user
            }
        }
    }

    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension InitialViewModel: NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
}
