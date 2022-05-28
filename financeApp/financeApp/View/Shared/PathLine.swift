//
//  PathLine.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 24/05/22.
//

import SwiftUI

struct PathLine: View {
    @Binding var lineWidth: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 10, y: 0))
            path.addLine(to: CGPoint(x: lineWidth, y: 0))
        }
        .stroke(Color.remnant, lineWidth: 0.4)
    }
}
