//
//  StatsCard.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import SwiftUI

struct StatsCard: View {
    @Binding var degree: Double
    var body: some View {
        ZStack{
            LinearGradient(colors: [.walletGradient1, .walletGradient2], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            //TODO: - Show all categories
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        .frame(width: UIScreen.main.bounds.width-25,
               height: UIScreen.main.bounds.height*0.25)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 20, x: 3, y: 7)
    }
}
