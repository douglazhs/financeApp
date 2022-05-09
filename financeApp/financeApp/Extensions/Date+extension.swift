//
//  Date+extension.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import Foundation

extension Date{
    static func monthYearFormat(_ date: Date) -> String{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM yyyy"
        return dateFormater.string(from: date)
    }
}
