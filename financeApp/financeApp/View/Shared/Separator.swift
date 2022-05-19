//
//  Separator.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 16/05/22.
//

import SwiftUI

struct Separator: View {
    var body: some View {
        Rectangle()
            .fill(.primary)
            .frame(width: UIScreen.main.bounds.width*0.8, height: 0.15, alignment: .center)
    }
}

