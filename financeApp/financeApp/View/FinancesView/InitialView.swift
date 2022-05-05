//
//  InitialView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation
import SwiftUI

struct InitialView: View{
    var body: some View{
        ZStack{
            
            VStack{
            
                WalletCard()
                    .padding()
                
                FinancesView()
                    .padding()
                    .ignoresSafeArea()
                
            }
        }
        .background(
            Color(BACKGROUND_COLOR)
        )
        .navigationViewStyle(.stack)
        .navigationTitle("Wallet")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(ADD_ICON)
                }

            }
        }
    }
}
