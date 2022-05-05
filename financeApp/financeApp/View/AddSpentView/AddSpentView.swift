//
//  AddSpentView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import SwiftUI

struct AddSpentView: View {
    @StateObject var viewModel: AddSpentViewModel = AddSpentViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                
                TextField(text: $viewModel.name, prompt: Text("Name")) {
                    
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundColor(.red)
                        .background(.blue)
                }
                
                Picker(selection: $viewModel.type) {
                    
                    ForEach(SpentCategory.allCases, id: \.self){ cat in

                            Text(cat.rawValue)
                    }
                } label: {
                    Text("Category")
                    
                }
                .pickerStyle(.automatic)
                
                DatePicker("Date", selection: $viewModel.date, in: ...Date(), displayedComponents: .date)
                
                TextField(text: $viewModel.name, prompt: Text("Value")) {
                    
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundColor(.red)
                        .background(.blue)
                }

            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack{
                        Text("Add")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .background(
            Color(BACKGROUND_COLOR)
                .ignoresSafeArea()
        )
    }
}

struct AddSpentView_Previews: PreviewProvider {
    static var previews: some View {
        AddSpentView()
    }
}
