//
//  Spent+extension.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import Foundation
import CoreData

extension Spent: BaseModel{
    static var all: NSFetchRequest<Spent>{
        let request = Spent.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}
