//
//  AddSpentView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import SwiftUI

struct AddSpentView: View {
    var body: some View {
        ZStack{
            VStack{
//                TextField(
//                    "Name",
//                    text: 
//                )
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack{
                        Text("Add")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct AddSpentView_Previews: PreviewProvider {
    static var previews: some View {
        AddSpentView()
    }
}
