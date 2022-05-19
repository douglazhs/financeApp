//
//  ContentView.swift
//  financeApp
//
//  Created by Douglas Henrique de Souza Pereira on 01/05/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("needsAppOnboarding") var needsAppOnboarding: Bool = true
    
    var body: some View {
        NavigationView{
            InitialView()
        }
        .fullScreenCover(isPresented: $needsAppOnboarding) {
            OnboardingView(needsAppOnboarding: $needsAppOnboarding)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
