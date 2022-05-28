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
            
            TextField(placeholder, text: $viewModel.name)
                .textFieldStyle(.automatic)
                .textFieldStyle(.plain)
                .textFieldModifier()
                .foregroundColor(.primaryFont)
        case .number:
            
            TextField(placeholder, text: $viewModel.cost)
                .textFieldStyle(.automatic)
                .keyboardType(.decimalPad)
                .textFieldModifier()
                .foregroundColor(.primaryFont)
        }
    }
}
