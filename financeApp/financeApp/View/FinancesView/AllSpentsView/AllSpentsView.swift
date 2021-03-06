//
//  AllSpentsView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation
import SwiftUI

struct AllSpentsView: View{
    @EnvironmentObject var viewModel: FinancesViewModel
    
    var body: some View{
        ScrollView(showsIndicators: false){
            
            VStack(alignment: .leading, spacing: 12){
                
                ForEach(viewModel.spents, id: \.id) { spent in
                    NavigationLink {
                        CostInformationView(spent: spent)
                    } label: {
                        CostCard(spent: spent)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}
