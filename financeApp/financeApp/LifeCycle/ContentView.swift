//
//  ContentView.swift
//  financeApp
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
