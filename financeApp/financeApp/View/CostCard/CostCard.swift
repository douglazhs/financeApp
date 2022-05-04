//
//  CostCard.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

struct CostCard: View {
    var body: some View {
        ZStack{
            HStack{
                Circle()
                    .frame(width: 70, height: 70)
                    .padding(20)
                
                VStack(alignment: .leading, spacing: 5){
                    Text("Spotify")
                        .font(.system(size: 18, weight: .semibold, design: .default))
                    
                    Text("Month: April")
                        .font(.system(size: 14, weight: .semibold, design: .default))
                        .foregroundColor(Color(SECONDARY_FONT_COLOR))
                    
                    Text("Type: Streaming")
                        .font(.system(size: 14, weight: .semibold, design: .default))
                        .foregroundColor(Color(SECONDARY_FONT_COLOR))
                    
                }
                
                Spacer()
                
                Text("R$9,90")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .padding(.horizontal, 20)
                    .foregroundColor(Color(SPENT_COLOR))
            }
        }
        .background(
            Color.white
        )
        .frame(width: UIScreen.main.bounds.width-25,
               height: UIScreen.main.bounds.height*0.12)
        .cornerRadius(20)
    }
}

struct CostCard_Previews: PreviewProvider {
    static var previews: some View {
        CostCard()
    }
}
