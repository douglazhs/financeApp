//
//  DataController.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation
import CoreData

class CoreDataManager: NSObject, ObservableObject{
    let persistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    private var fetchedUserController: NSFetchedResultsController<User>
    private var fetchedSpentController: NSFetchedResultsController<Spent>
    
    private override init(){
        persistentStoreContainer = NSPersistentContainer(name: "FinancesModel")
        persistentStoreContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load Core Data \(error)")
            }
        }
        fetchedSpentController = NSFetchedResultsController(fetchRequest: Spent.all, managedObjectContext: persistentStoreContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedUserController = NSFetchedResultsController(fetchRequest: User.all, managedObjectContext: persistentStoreContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedSpentController.delegate = self
        fetchedUserController.delegate = self
    }
    
    public func fetchUser(completion: @escaping (User) -> Void){
        do{
            try fetchedUserController.performFetch()
            guard let user = fetchedUserController.fetchedObjects else{
                return
            }
            guard let user = user.first else {
                return
            }
            completion(user)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    public func fetchSpents(completion: @escaping ([Spent]) -> Void){
        do{
            try fetchedSpentController.performFetch()
            guard let spents = fetchedSpentController.fetchedObjects else{
                return
            }
            completion(spents)
        }catch{
            print(error.localizedDescription)
        }
    }
}

extension CoreDataManager: NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {

    }
}
