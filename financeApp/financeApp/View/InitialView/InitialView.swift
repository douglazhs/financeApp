//
//  InitialView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation
import SwiftUI

struct InitialView: View{
    @StateObject var viewModel = InitialViewModel(context: CoreDataManager.shared.persistentStoreContainer.viewContext)
    @State var showAddScreen: Bool = false
    @State var backDegree: Double = -90.0
    @State var frontDegree: Double = 0.0
    @State var isFlipped: Bool = false
    let durationAndDelay : CGFloat = 0.2
    
    var body: some View{
        ZStack{
            
            VStack{
                
                ZStack{
                    WalletCard(user: $viewModel.user, degree: $frontDegree)
                        .padding()
                    
                    StatsCard(degree: $backDegree)
                        .padding()
                }
                .onTapGesture {
                    //TODO: - Flip the card when touch It
                }
                
                FinancesView(budget: $viewModel.budget)
                    .padding()
                    .ignoresSafeArea()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .background(
            Color.background
        )
        .navigationViewStyle(.stack)
        .navigationTitle("Wallet")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddSpentView()

                } label: {
                    Image(ADD_ICON)
                }
            }
        }
    }
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
}
