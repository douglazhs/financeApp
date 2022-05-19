//
//  OnboardingViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 18/05/22.
//

import Foundation
import CoreData

class OnboardingViewModel: ObservableObject{
    @Published var budget: String = ""
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    /// Create user and save at CoreData just once
    func createUser(){
        let user = User(context: context)
        user.budget = Double(budget) ?? 0
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
}
