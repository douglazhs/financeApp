//
//  FinancesHeaderView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation
import SwiftUI

struct FinancesHeaderView: View{
    @EnvironmentObject var viewModel: FinancesViewModel
    
    var body: some View{
        HStack{
            
            Text("Spents")
                .font(.custom(URBANIST_BOLD, size: 24))
                .foregroundColor(.primaryFont)
            
            Spacer()
            
            Button {
                viewModel.showSearchView = true
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

