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
    @Published var spents = [Spent]()
    @Published var showSearchView: Bool = false
    
    var dataManager: DataFetchable
    
    init(dataManager: DataFetchable){
        self.dataManager = dataManager
        super.init()
    }
    
    func getAllSpents(){
        dataManager.fetchSpents { spents in
            withAnimation {
                self.spents = spents
            }
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
