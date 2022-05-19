//
//  TypePicker.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 06/05/22.
//

import Foundation
import SwiftUI

struct TypePicker: View{
    @EnvironmentObject var viewModel: AddSpentViewModel
    
    var body: some View{
        ZStack{
            Picker("Category Type", selection: $viewModel.type) {
                
                ForEach(SpentCategory.allCases, id: \.self){ cat in
                    
                    Text(cat.rawValue)
                        .pickerViewModifier()
                }
            }
            .pickerViewModifier()
            .pickerStyle(.wheel)
            .foregroundColor(.primaryFont)
        }
    }
}
