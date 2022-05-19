//
//  Salary.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import SwiftUI

struct Salary: View {
    @EnvironmentObject var viewModel: WalletViewModel
    
    @State var showPopUp: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Budget")
                .font(.custom(URBANIST_REGULAR, size: 15))
                .foregroundColor(.secondaryFontColor)
            
            if viewModel.isEditing{
                HStack(spacing: 0){
                    Text("R$")
                    
                    TextField("\(viewModel.budget)", text: $viewModel.budget)
                        .keyboardType(.numberPad)
                        .onSubmit {
                            withAnimation {
                                viewModel.showPopUp = true
                            }
                        }
                }
                .font(.custom(URBANIST_BOLD, size: 24))
                .foregroundColor(.primaryFont)
                .padding(.vertical, 5)
            }else{
                FormattedSalary(isEditing: $viewModel.isEditing)
                    .environmentObject(viewModel)
                    .padding(.vertical, 5)
            }
        }
        .alert("New Budget!", isPresented: $viewModel.showPopUp, actions: {
            Button("Yes", role: .destructive, action: {
                viewModel.updateBudget()
            })

            Button("Cancel", role: .cancel) {
                
            }
        }, message: {
            Text("Are you sure you want to change your budget?")
        })
    }
}

struct FormattedSalary: View{
    @EnvironmentObject var viewModel: WalletViewModel
    @Binding var isEditing: Bool
    
    var body: some View{
        
        Text(String(format: "R$%.02f", "%.2f\(viewModel.budget)"))
            .font(.custom(URBANIST_BOLD, size: 24))
            .foregroundColor(.primaryFont)
            .onTapGesture {
                withAnimation {
                    isEditing = true
                }
            }
    }
}
