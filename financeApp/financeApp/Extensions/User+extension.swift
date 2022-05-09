//
//  User+extension.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import Foundation
import CoreData

extension User: BaseModel{
    static var all: NSFetchRequest<User>{
        let request = User.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}
