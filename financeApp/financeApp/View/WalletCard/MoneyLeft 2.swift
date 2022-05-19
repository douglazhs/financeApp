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
                .font(.system(size: 15, weight: .regular, design: .default))
            
            Spacer()
            
            Text("R$500,00")
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(.remnant)
        }
    }
}

struct MoneyLeft_Previews: PreviewProvider {
    static var previews: some View {
        MoneyLeft()
    }
}
