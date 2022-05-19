//
//  OnboardingView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 17/05/22.
//

import SwiftUI

struct OnboardingView: View {
    @State var text: String = ""
    @State var index: Int = 0
    @Binding var needsAppOnboarding: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                TabView(selection: $index) {
                    OnboardingInfo(title: "Adicione seus gastos",
                                   description: "Você pode adicionar todos os seus gastos no mês em nosso aplicativo.",
                                   image: ADD_COSTS_ILLUSTRATION)
                    .tag(0)
                    
                    OnboardingInfo(title: "Separe por categorias",
                                   description: "É possível separar por categorias os seus gastos, como streaming, mercado e outros!",
                                   image: CATEGORIES_ILLUSTRATION)
                    .tag(1)
                    
                    OnboardingSubmitView(needsAppOnboarding: $needsAppOnboarding)
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
                .padding(.top, 10)
            }
        }
    }
}
