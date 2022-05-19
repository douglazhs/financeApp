//
//  AddSpentView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import SwiftUI

struct AddSpentView: View {
    @StateObject var viewModel: AddSpentViewModel = AddSpentViewModel(context: CoreDataManager.shared.persistentStoreContainer.viewContext)
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            Form{
                Section("Name"){
                    AddTextField(placeholder: "Ex: Spotify", enterType: .text)
                        .environmentObject(viewModel)
                }
                
                Section("Cost"){
                    
                    AddTextField(placeholder: "Ex: R$9,90", enterType: .number)
                        .environmentObject(viewModel)
                }
                
                Section("Type"){
                    TypePicker()
                        .environmentObject(viewModel)
                }
                .frame(maxHeight: UIScreen.main.bounds.height*0.15)
                
                Section("Date"){
                    DatePicker("Purchase date", selection: $viewModel.date, in: ...Date(), displayedComponents: .date)
                        .font(.custom(URBANIST_SEMIBOLD, size: 16))
                        .foregroundColor(.primaryFont)
                }
            }
            .background(Color.background)
            .navigationTitle("Add")
            .navigationBarBackButtonHidden(true)
        }
        .onTapGesture {
            viewModel.hideKeyboard()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.addSpent()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(CHECKMARK)
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.primaryFont)
                }
            }
        }
    }
}

struct AddSpentView_Previews: PreviewProvider {
    static var previews: some View {
        AddSpentView()
    }
}
