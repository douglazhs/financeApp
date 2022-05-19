//
//  CostView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

/// When the
struct FinancesView: View {
    @StateObject var viewModel = FinancesViewModel()
    @Binding var budget: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            FinancesHeaderView()
            
            AllSpentsView(budget: $budget)
                .environmentObject(viewModel)
        }
        .background(
            Color.background
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.maxX)
        )
        .onAppear {
            viewModel.getAllSpents()
        }
    }
}
