//
//  SpentCategory.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 04/05/22.
//

import Foundation

enum SpentCategory: String, CaseIterable{
    case streaming = "Streaming"
    case purchase = "Purchase"
    case clothes = "Clothes"
    case other = "Other"
    case unknown = "Unknown"
}
