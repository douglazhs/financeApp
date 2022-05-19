//
//  WalletViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI
import CoreData

class WalletViewModel: NSObject, ObservableObject{
    @Published var budget: String = ""
    @Published var isEditing: Bool = true
    @Published var showPopUp: Bool = false
    @Published var fetchedBudget: Double = 0
    @Published var totalExpanses: Double = 0
    @Published var remainingBudget: Double = 0
    @Published var user: User?
    var dataManager: DataFetchable
    var spents: [Spent] = [Spent]()
    
    init(dataManager: DataFetchable){
        self.dataManager = dataManager
        super.init()
        fetchUser()
        calculateTotalExpenses()
    }
    
    func fetchUser(){
        dataManager.fetchUser { user in
            self.user = user
            self.budget = String(format: "%.2f", user.budget)
        }
    }
    
    func calculateTotalExpenses(){
        dataManager.fetchSpents { spents in
            self.spents = spents
        }
        
        for spent in spents{
            self.totalExpanses += spent.cost
        }
        
        guard let user = user else {
            return
        }
        
        self.remainingBudget = totalExpanses - user.budget
    }
    
    func updateBudget(){
        guard let user = user else {
            return
        }
        user.budget = Double("\(budget)") ?? 0.0
        do{
            try user.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    /// Hide keyboard when click at screen
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        isEditing = false
        showPopUp = true
    }
}

extension WalletViewModel: NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let user = controller.fetchedObjects?.first as? User else{
            return
        }
        withAnimation {
            self.budget = "\(user.budget)"
        }
    }
}
