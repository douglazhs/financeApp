//
//  CostViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import Foundation
import CoreData
import SwiftUI

class FinancesViewModel: NSObject, ObservableObject{
    var context = CoreDataManager.shared.persistentStoreContainer.viewContext
    private let fetchedSpentsController: NSFetchedResultsController<Spent>
    
    @Published var spents = [Spent]()
    
    override init(){
        fetchedSpentsController = NSFetchedResultsController(fetchRequest: Spent.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        fetchedSpentsController.delegate = self
        getAllSpents()
    }
    
    func getAllSpents(){
        do{
            try fetchedSpentsController.performFetch()
            guard let spents = fetchedSpentsController.fetchedObjects else{
                return
            }
            self.spents = spents
        }catch{
            print(error.localizedDescription)
        }
    }
}

extension FinancesViewModel: NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let spents = controller.fetchedObjects as? [Spent] else {
            return
        }
        withAnimation {
            self.spents = spents
        }
    }
}
