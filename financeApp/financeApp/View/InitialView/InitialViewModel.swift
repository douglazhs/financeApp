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
    @Published var remaining: Double = 0
    @Published var user: User?
    
    private var fetchedBudgetController: NSFetchedResultsController<User>
    
    init(context: NSManagedObjectContext){
        fetchedBudgetController = NSFetchedResultsController(fetchRequest: User.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedBudgetController.delegate = self
        fetchBudget()
    }
    
    func fetchBudget(){
        do{
            try fetchedBudgetController.performFetch()
            guard let user = fetchedBudgetController.fetchedObjects else{
                return
            }
            guard let user = user.first else {
                return
            }
            self.user = user
            self.budget = String(format: "%.2f", user.budget)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func calculateBudget(){
        
    }
    
    func updateBudget(){
        user?.budget = Double("\(budget)") ?? 0.0
        do{
            try user?.save()
        }catch{
            print(error.localizedDescription)
        }
    }
}

extension InitialViewModel: NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let user = controller.fetchedObjects?.first as? User else{
            return
        }
        withAnimation {
            self.user = user
            self.budget = "\(user.budget)"
        }
    }
}
