//
//  DataController.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject{
    let persistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init(){
        persistentStoreContainer = NSPersistentContainer(name: "FinancesModel")
        persistentStoreContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load Core Data \(error)")
            }
        }
    }
}
