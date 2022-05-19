//
//  CostCard.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

struct CostCard: View {
    @StateObject var viewModel: CostCardViewModel = CostCardViewModel()
    @Binding var user: User?
    var spent: Spent
    
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [Color.white, viewModel.categoryColor.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            HStack{
                
                viewModel.categoryIcon
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(20)
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        
                        Text(spent.name ?? "Unknown")
                            .font(.custom(URBANIST_SEMIBOLD, size: 18))
                            .foregroundColor(.primaryFont)
                        
                        Spacer()
                        
                        Image(SEPARATOR)
                        
                        Text(String(format: "%.1f", viewModel.calcultatePercentage(with: user?.budget ?? 0.0, and: spent.cost)))
                            .font(.custom(URBANIST_MEDIUM, size: 10))
                            .foregroundColor(.secondaryFontColor)
                        
                        Text(Date.monthYearFormat(spent.date ?? .now))
                            .font(.custom(URBANIST_MEDIUM, size: 10))
                            .foregroundColor(.secondaryFontColor)
                            .padding(.horizontal, 20)
                    }
                    
                    HStack{
                        
                        Label {
                            Text(spent.type ?? SpentCategory.unknown.rawValue)
                                .font(.custom(URBANIST_SEMIBOLD, size: 14))
                                .foregroundColor(.secondaryFontColor)
                        } icon: {
                            Image(BOOKMARK)
                        }
                        
                        Spacer()
                        
                        Text(String(format: "R$%.2f", spent.cost))
                            .font(.custom(URBANIST_REGULAR, size: 14))
                            .padding(.horizontal, 20)
                            .foregroundColor(.spent)
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.getCategory(for: spent.type ?? "")
            viewModel.chooseCategoryPack()
        })
        .frame(width: UIScreen.main.bounds.width-25,
               height: UIScreen.main.bounds.height*0.12)
        .cornerRadius(20)
    }
}
