//
//  AddTextField.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 06/05/22.
//

import Foundation
import SwiftUI

struct AddTextField: View{
    var placeholder: String
    var enterType: EnterType
    @EnvironmentObject var viewModel: AddSpentViewModel
    
    var body: some View{
        
        switch enterType {
        case .text:
            VStack(alignment: .leading){
                Text("Name")
                    .font(.custom(URBANIST_SEMIBOLD, size: 16))
                    .foregroundColor(.primaryFont)
                
                TextField(placeholder, text: $viewModel.name)
                    .textFieldStyle(.automatic)
                    .textFieldStyle(.plain)
                    .frame(maxHeight: 25)
                    .padding(10)
                    .background(
                        Color.walletGradient1
                            .opacity(0.6)
                    )
                    .foregroundColor(.primaryFont)
                    .cornerRadius(12)
            }
        case .number:
            VStack(alignment: .leading){
                Text("Cost")
                    .font(.custom(URBANIST_SEMIBOLD, size: 16))
                    .foregroundColor(.primaryFont)
                
                TextField(placeholder, text: $viewModel.cost)
                    .textFieldStyle(.automatic)
                    .keyboardType(.decimalPad)
                    .frame(maxHeight: 25)
                    .padding(10)
                    .background(
                        Color.walletGradient1
                            .opacity(0.6)
                    )
                    .foregroundColor(.primaryFont)
                    .cornerRadius(12)
            }
        }
    }
}
