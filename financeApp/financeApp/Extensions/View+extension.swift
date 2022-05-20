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
                    .padding(.top)
                    .background(LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor").opacity(0.1)],
                                               startPoint: .top,
                                               endPoint: .bottom))
                Spacer()
            }
        }
    }
}
