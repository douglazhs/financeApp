//
//  AllSpentsView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation
import SwiftUI

struct AllSpentsView: View{
    @EnvironmentObject var viewModel: FinancesViewModel
    @Binding var user: User?
    
    //ScrollView offset
    @State var startOffset: Double = 0
    @State var scrollViewOffset: Double = 0
    
    var body: some View{
        ScrollView(showsIndicators: false){
            
            VStack(alignment: .leading, spacing: 12){
                
                ForEach(viewModel.spents, id: \.id) { spent in
                    NavigationLink {
                        CostInformationView(spent: spent, user: user)
                    } label: {
                        CostCard(user: $user, spent: spent)
                    }
                }
            }
            .overlay(
                GeometryReader{ proxy -> Color in
                    DispatchQueue.main.async {
                        if startOffset == 0{
                            startOffset = proxy.frame(in: .global).minY
                        }
                        let offset = proxy.frame(in: .global).minY
                        self.scrollViewOffset = offset - startOffset
                        print(scrollViewOffset)
                        withAnimation {
                            viewModel.lineWidth = scrollViewOffset > 400 ? UIScreen.main.bounds.width : 0
                        }
                    }
                    return Color.clear
                }
            )
        }
        .frame(maxWidth: .infinity)
    }
}
