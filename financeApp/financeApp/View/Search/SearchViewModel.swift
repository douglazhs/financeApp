//
//  SearchViewModel.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 20/05/22.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject{
    @Published var spentName: String = ""
    @Published var spents: [Spent] = [Spent]()
    @Published var filteredSpents: [Spent] = [Spent]()
    @Published var user: User?
    
    var dataManager: DataFetchable
    
    init(dataManager: DataFetchable){
        self.dataManager = dataManager
        fetchSpents()
        fetchUser()
    }
    
    func fetchSpents(){
        dataManager.fetchSpents { spents in
            withAnimation(.easeIn(duration: 0.5)){
                self.spents = spents
            }
        }
    }
    
    func fetchUser(){
        dataManager.fetchUser { user in
            withAnimation {
                self.user = user
            }
        }
    }
    
    func filterSpents(){
        withAnimation {
            filteredSpents = spents.filter { spent in
                guard let name = spent.name else { return false}
                return name.contains(spentName)
            }
        }
    }
    
    /// Hide keyboard when click at screen
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
