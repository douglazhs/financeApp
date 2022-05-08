//
//  AllSpentsView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation
import SwiftUI

struct AllSpentsView: View{
    var body: some View{
        ScrollView(showsIndicators: false){
            
            VStack(alignment: .leading, spacing: 12){
                
                ForEach(0..<10) { _ in
                    NavigationLink {
                        CostInformationView()
                    } label: {
                        CostCard(categoryIcon: "streamingIcon")
                    }
                }
                //TODO: - Show all mensal costs saved at Core Data
            }
        }
        .frame(maxWidth: .infinity)
    }
}
