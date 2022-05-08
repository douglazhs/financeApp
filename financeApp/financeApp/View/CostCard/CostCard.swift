//
//  CostCard.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

struct CostCard: View {
    var categoryIcon: String
    
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [Color.white, Color.white.opacity(0)], startPoint: .top, endPoint: .bottom)
            
            HStack{
                
                Image(categoryIcon)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(20)
                
                VStack(alignment: .leading, spacing: 5){
                    
                    HStack{
                        
                        Text("Spotify")
                            .font(.system(size: 18, weight: .semibold, design: .default))
                            .foregroundColor(Color(PRIMARY_FONT_COLOR))
                        
                        Spacer()
                        
                        Image("separator")
                        
                        Text("0,2%")
                            .font(.system(size: 10, weight: .medium, design: .default))
                        
                        Text("April, 2022")
                            .font(.system(size: 10, weight: .semibold, design: .default))
                            .foregroundColor(Color(SECONDARY_FONT_COLOR))
                            .padding(.horizontal, 20)
                    }
                    
                    HStack{
                        
                        Label {
                            Text("Streaming")
                                .font(.system(size: 14, weight: .semibold, design: .default))
                                .foregroundColor(Color(SECONDARY_FONT_COLOR))
                        } icon: {
                            Image("bookmark")
                        }
                        
                        Spacer()
                        
                        Text("R$9,90")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .padding(.horizontal, 20)
                            .foregroundColor(Color(SPENT_COLOR))
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width-25,
               height: UIScreen.main.bounds.height*0.12)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 20, x: 4, y: 10)
    }
}
