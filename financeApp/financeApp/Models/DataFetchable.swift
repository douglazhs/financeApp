//
//  DataFetchable.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 18/05/22.
//

import Foundation

public protocol DataFetchable{
    func fetchUser(completion: @escaping (User) -> Void)
    
    func fetchSpents(completion: @escaping ([Spent]) -> Void)
}

extension CoreDataManager: DataFetchable{
    
}
