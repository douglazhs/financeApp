//
//  RemainingView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import SwiftUI

struct MoneyLeft: View {
    var body: some View {
        HStack{
            Text("Restante")
                .font(.custom(URBANIST_REGULAR, size: 14))
                .foregroundColor(.primaryFont)
            
            Spacer()
            
            Text("R$500,00")
                .font(.custom(URBANIST_MEDIUM, size: 14))
                .foregroundColor(.remnant)
        }
    }
}

struct MoneyLeft_Previews: PreviewProvider {
    static var previews: some View {
        MoneyLeft()
    }
}
