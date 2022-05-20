//
//  TotalExpenses.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import SwiftUI

struct TotalExpenses: View {
    @EnvironmentObject var viewModel: WalletViewModel
    
    var body: some View {
        HStack{
            Text("Total expanses")
                .font(.custom(URBANIST_SEMIBOLD, size: 14))
                .foregroundColor(.primaryFont)
            
            Spacer()
            
            Text(String(format: "R$%.2f", viewModel.totalExpanses))
                .font(.custom(URBANIST_SEMIBOLD, size: 14))
                .foregroundColor(.spent)
        }
    }
}
