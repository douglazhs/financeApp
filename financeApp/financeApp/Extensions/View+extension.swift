//
//  View+extension.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 20/05/22.
//

import Foundation
import SwiftUI

extension View {
    func listBlur() -> some View {
        return self.overlay {
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .padding(.top, 15)
                    .background(LinearGradient(colors: [Color.background, Color.background.opacity(0.1)],
                                               startPoint: .top,
                                               endPoint: .bottom))
                Spacer()
            }
        }
    }
}
