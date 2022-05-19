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
        VStack(alignment: .leading){
            
            Text("Category")
                .font(.custom(URBANIST_SEMIBOLD, size: 16))

            ZStack{
                Picker(selection: $viewModel.type) {
                    
                    ForEach(SpentCategory.allCases, id: \.self){ cat in
                        
                        Text(cat.rawValue)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .circular)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.red)
                            )
                            .foregroundColor(.primary)
                    }
                } label: {
                    Text("")
                }
                .padding(5)
                .pickerStyle(.automatic)
                .foregroundColor(.primaryFont)
            }
            .foregroundColor(.green)
        }
    }
}
