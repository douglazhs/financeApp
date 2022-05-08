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
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundColor(Color(PRIMARY_FONT_COLOR))
                
                TextField(text: $viewModel.name, prompt: Text(placeholder)) {
                   
                }
                .textFieldStyle(.roundedBorder)
                .textFieldStyle(.plain)
            }
        case .number:
            VStack(alignment: .leading){
                Text("Cost")
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundColor(Color(PRIMARY_FONT_COLOR))
                
                TextField(text: $viewModel.cost, prompt: Text(placeholder)) {
                    
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            }
        }
    }
}
