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
            
            Color(BACKGROUND_COLOR)
                .ignoresSafeArea()
            
            VStack(spacing: 20){
        
                AddTextField(placeholder: "Ex: Spotify", enterType: .text)
                    .environmentObject(viewModel)
                
                HStack{
                    
                    TypePicker()
                        .environmentObject(viewModel)
                    
                    Spacer()
                }
                
                DatePicker("Date", selection: $viewModel.date, in: ...Date(), displayedComponents: .date)
                
                AddTextField(placeholder: "Ex: R$9,90", enterType: .number)
                    .environmentObject(viewModel)
                
                Spacer()
            }
            .navigationTitle("Add")
            .padding()
        }
    }
}

struct AddSpentView_Previews: PreviewProvider {
    static var previews: some View {
        AddSpentView()
    }
}
