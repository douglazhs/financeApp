//
//  OnboardingInfo.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 17/05/22.
//

import SwiftUI

struct OnboardingInfo: View {
    @State var title: String
    @State var description: String
    @State var image: String
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            VStack{
                Text(title)
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .foregroundColor(.primaryFont)
                    .padding(.top, 20)
                
                Spacer()
                
                Image(image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width*0.7,
                           height: UIScreen.main.bounds.width*0.7)
                
                Spacer()
                
                Text(description)
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primaryFont)
                    .padding(.bottom, 25)
            }
            .padding()
        }
    }
}

struct OnboardingInfo_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInfo(title: "Cetegories", description: "Separe seus gastos por categorias.", image: ADD_COSTS_ILLUSTRATION)
    }
}
