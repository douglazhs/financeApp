//
//  OnboardingSubmitView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 17/05/22.
//

import SwiftUI

struct OnboardingSubmitView: View {
    @StateObject var viewModel = OnboardingViewModel(context: CoreDataManager.shared.persistentStoreContainer.viewContext)
    @Binding var needsAppOnboarding: Bool
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            VStack{
                Text("Enter your budget!")
                    .font(.custom(URBANIST_SEMIBOLD, size: 24))
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .foregroundColor(.primaryFont)
                    .padding(.vertical, 20)
                
                Spacer()
                
                TextField("R$00,00", text: $viewModel.budget)
                    .keyboardType(.default)
                    .padding()
                    .background(
                        Color.walletGradient1
                            .opacity(0.6)
                    )
                    .foregroundColor(.primaryFont)
                    .cornerRadius(12)
                
                Spacer()
                
                Button {
                    if needsAppOnboarding{
                        viewModel.createUser()
                    }
                    needsAppOnboarding.toggle()
                } label: {
                    ZStack{
                        Text("Let's go")
                            .font(.custom(URBANIST_BOLD, size: 20))
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                }
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Color.walletGradient1)
                .foregroundColor(.primaryFont)
                .cornerRadius(12)
            }
            .padding()
        }
    }
}

