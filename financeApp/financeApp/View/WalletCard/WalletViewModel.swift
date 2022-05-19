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
    @Published var fetchedBudget: Double = 0
    var formattedBudget: Double {
        return (Double(budget) ?? 0) / 100
    }
    private var fetchedBudgetController: NSFetchedResultsController<User>
    
    init(context: NSManagedObjectContext){
        fetchedBudgetController = NSFetchedResultsController(fetchRequest: User.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedBudgetController.delegate = self    }
    
    func updateBudget(for user: User?){
        user?.budget = Double("\(budget)") ?? 0.0
        do{
            try user?.save()
        }catch{
            print(error.localizedDescription)
        }
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
