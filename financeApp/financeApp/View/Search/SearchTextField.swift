//
//  SearchTextField.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 24/05/22.
//

import SwiftUI

struct SearchTextField: View {
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        TextField("Spent name", text: $viewModel.spentName)
            .textFieldStyle(.automatic)
            .textFieldStyle(.plain)
            .textFieldModifier()
            .foregroundColor(.primaryFont)
            .onChange(of: viewModel.spentName, perform: { _ in
                viewModel.filterSpents()
            })
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
                    .fill(
                        LinearGradient(colors: [.walletGradient2, .walletGradient1], startPoint: .topLeading, endPoint: .topTrailing)
                    )
            }
    }
}
