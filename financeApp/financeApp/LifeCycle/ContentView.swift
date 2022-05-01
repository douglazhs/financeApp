//
//  ContentView.swift
//  financeApp
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            
            WalletCard()
            
            FinancesView()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
