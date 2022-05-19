//
//  TotalExpenses.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import SwiftUI

struct TotalExpenses: View {
    var body: some View {
        HStack{
            Text("Total expanses")
                .font(.custom(URBANIST_REGULAR, size: 14))

                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.primaryFont)
            
            Spacer()
            
            Text("R$1.500,00")
                .font(.custom(URBANIST_MEDIUM, size: 14))
                .foregroundColor(.spent)
        }
    }
}

struct TotalExpenses_Previews: PreviewProvider {
    static var previews: some View {
        TotalExpenses()
    }
}
