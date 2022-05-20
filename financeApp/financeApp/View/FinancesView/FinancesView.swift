//
//  CostView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

/// When the
struct FinancesView: View {
    @StateObject var viewModel = FinancesViewModel(dataManager: CoreDataManager.shared)
    @Binding var user: User?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            FinancesHeaderView()
                .environmentObject(viewModel)
            
            AllSpentsView(user: $user)
                .environmentObject(viewModel)
        }
        .popover(isPresented: $viewModel.showSearchView, content: {
            SearchView()
        })
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
