//
//  FontModifiers.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 19/05/22.
//

import Foundation
import SwiftUI

struct Primary: ViewModifier {
    private let font: Font
    private let foregroundColor: Color
    
    init(size: CGFloat, foregroundColor: Color) {
        self.font = .system(size: UIFontMetrics.default.scaledValue(for: size))
        self.foregroundColor = foregroundColor
    }

    init(font: Font, foregroundColor: Color) {
        self.font = font
        self.foregroundColor = foregroundColor
    }

    public func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(foregroundColor)
    }
}

extension View {
    func textFieldModifier() -> some View {
        ModifiedContent(content: self, modifier: Primary(font: .custom(URBANIST_SEMIBOLD, size: 16), foregroundColor: .primaryFont))
    }
    
    func pickerViewModifier() -> some View{
        ModifiedContent(content: self, modifier: Primary(font: .custom(URBANIST_SEMIBOLD, size: 16), foregroundColor: .primaryFont))
    }
}
