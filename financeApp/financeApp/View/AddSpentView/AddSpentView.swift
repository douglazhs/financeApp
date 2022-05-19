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
            
            VStack(spacing: 20){
        
                AddTextField(placeholder: "Ex: Spotify", enterType: .text)
                    .environmentObject(viewModel)
                
                AddTextField(placeholder: "Ex: R$9,90", enterType: .number)
                    .environmentObject(viewModel)
                
                HStack{
                    
                    TypePicker()
                        .environmentObject(viewModel)
                    
                    Spacer()
                }
                
                DatePicker("Date", selection: $viewModel.date, in: ...Date(), displayedComponents: .date)
                    .font(.system(size: 16, weight: .semibold, design: .default))
                
                Spacer()
            }
            .navigationTitle("Add")
            .navigationBarBackButtonHidden(true)
            .padding()
        }
        .onTapGesture {
            hideKeyboard()
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
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct AddSpentView_Previews: PreviewProvider {
    static var previews: some View {
        AddSpentView()
    }
}
