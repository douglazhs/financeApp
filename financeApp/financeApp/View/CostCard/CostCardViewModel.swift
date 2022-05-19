//
//  CostCardViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import Foundation
import SwiftUI

class CostCardViewModel: ObservableObject{
    @Published var categoryColor: Color = .gray
    @Published var categoryIcon: Image = Image("unknownIcon")
    @Published var category: SpentCategory = .unknown
    
    /// Get category of the spent, based on the String saved on CoreData
    /// - Parameter spentCategory: Value returned from CoreData
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
    
    /// Choose category color and icon, based on the return of the CoreData
    func chooseCategoryPack(){
        switch category {
        case .streaming:
            categoryColor = .streaming
            categoryIcon = Image(STREAMING_CARD_ICON)
        case .purchase:
            categoryColor = .purchase
            categoryIcon = Image(PURCHASE_CARD_ICON)
        case .clothes:
            categoryColor = .clothes
            categoryIcon = Image(CLOTHES_CARD_ICON)
        case .unknown:
            categoryColor = .gray
            categoryIcon = Image(STREAMING_CARD_ICON)
        case .other:
            categoryColor = .others
            categoryIcon = Image(OTHERS_CARD_ICON)
        }
    }
    
    /// Calculate the percentage of the spent based on user budget
    /// - Parameters:
    ///   - budget: User budget
    ///   - cost: User cost
    /// - Returns: Calculated percentage
    func calcultatePercentage(with budget: Double, and cost: Double) -> Double{
        let formattedBudget = Double("\(budget)") ?? 0.0
        let result = (100*cost) / formattedBudget
        return result
    }
}
