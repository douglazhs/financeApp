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
    @Binding var user: User?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            FinancesHeaderView()
            
            AllSpentsView(user: $user)
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
