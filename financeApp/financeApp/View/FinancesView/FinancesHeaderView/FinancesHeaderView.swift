//
//  FinancesHeaderView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation
import SwiftUI

struct FinancesHeaderView: View{
    var body: some View{
        HStack{
            
            Text("Spents")
                .font(.system(size: 25, weight: .bold, design: .default))
            
            Spacer()
            
            Button {
                //TODO: - Search a specific spent
            } label: {
                Image(SEARCH_ICON)
            }
            
            Button {
                //TODO: - Filter by category
            } label: {
                Image(FILTER_ICON)
                    .padding(.leading, 10)
            }
        }

    }
}

