//
//  Salary.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import SwiftUI

struct Salary: View {
    @EnvironmentObject var viewModel: WalletViewModel
    @State var isEditing: Bool = true
    @State var showPopUp: Bool = false
    @Binding var user: User?
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Salary")
                .font(.custom(URBANIST_REGULAR, size: 15))
                .foregroundColor(.secondaryFontColor)
            
            if isEditing{
                HStack(spacing: 0){
                    Text("R$")
                    
                    TextField("\(viewModel.budget)", text: $viewModel.budget)
                        .keyboardType(.numberPad)
                        .onSubmit {
                            withAnimation {
                                showPopUp.toggle()
                            }
                        }
                }
                .font(.custom(URBANIST_BOLD, size: 24))
                .foregroundColor(.primaryFont)
                .padding(.vertical, 5)
            }else{
                FormattedSalary(isEditing: $isEditing)
                    .environmentObject(viewModel)
                    .padding(.vertical, 5)
            }
        }
        .alert("New Budget!", isPresented: $showPopUp, actions: {
            Button("Yes", role: .destructive, action: {
                viewModel.updateBudget(for: user)
                isEditing.toggle()
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
        
        Text(String(format: "R$%.02f", viewModel.formattedBudget))
            .font(.custom(URBANIST_BOLD, size: 24))
            .foregroundColor(.primaryFont)
            .onTapGesture {
                withAnimation {
                    isEditing = true
                }
            }
    }
}
