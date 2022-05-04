//
//  WalletCard.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

struct WalletCard: View {
    var body: some View {
        ZStack{
            HStack{
                VStack(alignment: .leading, spacing: 20){
                    Text("Salary")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundColor(Color(SECONDARY_FONT_COLOR))
                    
                    Text("RS4.500,00")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .foregroundColor(Color(PRIMARY_FONT_COLOR))
                    
                    Spacer()
                    
                    HStack{
                        Text("Gasos totais")
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .foregroundColor(Color(PRIMARY_FONT_COLOR))
                        
                        Spacer()
                        
                        Text("R$1.500,00")
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .foregroundColor(Color(SPENT_COLOR))
                    }
                    
                    HStack{
                        Text("Restante")
                            .font(.system(size: 15, weight: .regular, design: .default))
                        
                        Spacer()
                        
                        Text("R$500,00")
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .foregroundColor(Color(REMNANT_COLOR))
                    }
                }
                .padding(15)
            }
        }
        .background(
            Color.white
                .cornerRadius(20)
        )
        .frame(width: UIScreen.main.bounds.width-25,
               height: UIScreen.main.bounds.height*0.2)
        .padding(.horizontal, 25)
    }
}

struct WalletCard_Previews: PreviewProvider {
    static var previews: some View {
        WalletCard()
    }
}
