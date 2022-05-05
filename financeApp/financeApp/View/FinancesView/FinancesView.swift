//
//  CostView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

/// When the
struct FinancesView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            FinancesHeaderView()
            
            AllSpentsView()
        }
        .background(
            Color(BACKGROUND_COLOR)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.maxX)
        )
    }
}

struct FinancesView_Previews: PreviewProvider {
    static var previews: some View {
        FinancesView()
    }
}
