//
//  CostView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

/// When the
struct FinancesView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            
            HStack{
                
                Text("Spents")
                    .font(.system(size: 25, weight: .bold, design: .default))
                
                Spacer()
                
                Button {
                    //TODO: - Search a specific spent
                } label: {
                    Image(SEARCH_ICON)
                }
                
                Button {
                    //TODO: - Filter by category
                } label: {
                    Image(FILTER_ICON)
                        .padding(.leading, 10)
                }
            }

            ScrollView(showsIndicators: false){
                
                    
                VStack(alignment: .leading, spacing: 12){
                    
                    ForEach(0..<10) { _ in
                        CostCard()
                    }
                    //TODO: - Show all mensal costs saved at Core Data
                }
            }
        }
        .background(
            Color(BACKGROUND_COLOR)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.maxX)
        )
    }
}

struct FinancesView_Previews: PreviewProvider {
    static var previews: some View {
        FinancesView()
    }
}
