//
//  CostInformationViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import Foundation
import SwiftUI
import CoreData

class CostInformationViewModel: ObservableObject{

    @Published var percentage: CGFloat = 0
    @Published var category: SpentCategory = .unknown
    @Published var categoryIcon: Image = Image(UNKNOWN_ICON)
    @Published var categoryColor: Color = .unknown
    
    func delete(_ spent: Spent){
        do{
            try spent.delete()
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
    
    func calculatePercentage(with spent: Double, and budget: Double){
        self.percentage = (100*spent) / budget
    }
}
