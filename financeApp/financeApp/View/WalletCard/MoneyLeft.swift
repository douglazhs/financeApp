//
//  RemainingView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import SwiftUI

struct MoneyLeft: View {
    @EnvironmentObject var viewModel: WalletViewModel
    
    var body: some View {
        HStack{
            Text("Remaining")
                .font(.custom(URBANIST_SEMIBOLD, size: 14))
                .foregroundColor(.primaryFont)
            
            Spacer()
            
            Text(String(format: "%.2f", viewModel.remainingBudget))
                .font(.custom(URBANIST_SEMIBOLD, size: 14))
                .foregroundColor(.remnant)
        }
    }
}

struct MoneyLeft_Previews: PreviewProvider {
    static var previews: some View {
        MoneyLeft()
    }
}
