//
//  WalletCard.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

struct WalletCard: View {
    @StateObject var viewModel = WalletViewModel(dataManager: CoreDataManager.shared)
    @Binding var degree: Double
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.walletGradient1, .walletGradient2], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            HStack{
                
                VStack(alignment: .leading, spacing: 20){
                    Salary()
                        .environmentObject(viewModel)
                    
                    Spacer()
                    
                    TotalExpenses()
                        .environmentObject(viewModel)
                    
                    MoneyLeft()
                        .environmentObject(viewModel)
                }
            }
            .padding(20)
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        .frame(width: UIScreen.main.bounds.width-25,
               height: UIScreen.main.bounds.height*0.25)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 20, x: 3, y: 7)
    }
}
