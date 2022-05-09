//
//  ProgressBar.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 07/05/22.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: CGFloat
    var color: Color
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 30.0)
                .opacity(0.3)
                .foregroundColor(color)
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 30.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270.0))
        }
    }
}
