//
//  AddSpentViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation

class AddSpentViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var type: SpentCategory = .other
    @Published var date: Date = .now
}
