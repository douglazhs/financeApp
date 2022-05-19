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
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(Color(PRIMARY_FONT_COLOR))
            
            ZStack{
                Picker(selection: $viewModel.type) {
                    
                    ForEach(SpentCategory.allCases, id: \.self){ cat in
                        
                        Text(cat.rawValue)
                    }
                } label: {
                    
                }
                .padding(5)
                .pickerStyle(.automatic)
            }
            .background(
                Color.gray
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
            )
        }
    }
}
