//
//  CostInformationView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 07/05/22.
//

import SwiftUI

struct CostInformationView: View {
    @State var progress: CGFloat = 10
    
    var body: some View {
        ZStack{
            Color(BACKGROUND_COLOR)
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                
                Image("streamingIcon")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top, 50)
                    .overlay {
                        //TODO: - Edit Button
                    }
                
                Label {
                    Text("Monday 10 April, 2022")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(Color(SECONDARY_FONT_COLOR))
                } icon: {
                    Image("date")
                        .resizable()
                        .frame(width: 24, height: 24)
                }

                VStack{
                    
                    Text("Price")
                        .font(.system(size: 12, weight: .semibold, design: .default))
                        .foregroundColor(Color(PRIMARY_FONT_COLOR))
                    
                    Text("R$9,90")
                        .font(.system(size: 25, weight: .semibold, design: .default))
                        .foregroundColor(Color(SPENT_COLOR))
                }
                
                //TODO: - Gráfico
                
                ProgressBar(progress: $progress)
                    .frame(width: 175.0, height: 175.0)
                
                Text("This value use 0,2% of your total orçament.")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(Color(PRIMARY_FONT_COLOR))
                    .frame(maxWidth: UIScreen.main.bounds.maxX/1.5)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
            }
            .navigationViewStyle(.stack)
            .navigationTitle("Wallet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        
                    } label: {
                        Image("delete")
                    }

                }
                
                ToolbarItem(placement: .principal) {
                    Text("Spotify")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(Color(PRIMARY_FONT_COLOR))
                }
            }
        }
    }
}

struct CostInformationView_Previews: PreviewProvider {
    static var previews: some View {
        CostInformationView()
    }
}
