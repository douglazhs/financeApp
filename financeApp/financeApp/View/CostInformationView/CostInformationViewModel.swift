//
//  CostInformationViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import Foundation
import SwiftUI
import CoreData

class CostInformationViewModel: NSObject, ObservableObject{
    private (set) var context = CoreDataManager.shared.persistentStoreContainer.viewContext
    private let fetchedUserController: NSFetchedResultsController<User>
    var user: User?
    @Published var percentage: CGFloat = 0
    @Published var category: SpentCategory = .unknown
    @Published var categoryIcon: Image = Image("")
    @Published var categoryColor: Color = Color("")
    
    override init(){
        fetchedUserController = NSFetchedResultsController(fetchRequest: User.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        fetchedUserController.delegate = self
        getUser()
    }
    
    func getUser(){
        do{
            try fetchedUserController.performFetch()
            guard let user = fetchedUserController.fetchedObjects else{
                return
            }
            guard let user = user.first else { return }
            self.user = user
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func getCategory(for spentCategory: String){
        switch spentCategory{
        case "Streaming":
            category = .streaming
            break
        case "Purchase":
            category = .purchase
            break
        case "Other":
            category = .other
            break
        case "Clothes":
            category = .clothes
        default:
            break
        }
    }
    
    func chooseCategoryPack(){
        switch category {
        case .streaming:
            categoryColor = .streaming
            categoryIcon = Image(STREAMING_ICON)
        case .purchase:
            categoryColor = .purchase
            categoryIcon = Image(PURCHASE_ICON)
        case .clothes:
            categoryColor = .clothes
            categoryIcon = Image(CLOTHES_ICON)
        case .unknown:
            categoryColor = .gray
            categoryIcon = Image(STREAMING_ICON)
        case .other:
            categoryColor = .others
            categoryIcon = Image(OTHERS_ICON)
        }
    }
    
    func calculatePercentage(with spent: Double){
        self.percentage = (100*spent)/(user?.budget ?? 0.0)
    }
}

extension CostInformationViewModel: NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let user = controller.fetchedObjects as? [User] else{
            return
        }
        guard let user = user.first else {
            return
        }
        self.user = user
    }
}
