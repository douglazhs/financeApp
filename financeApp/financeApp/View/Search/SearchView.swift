//
//  SearchView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 20/05/22.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel = SearchViewModel(dataManager: CoreDataManager.shared)
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            VStack{
                TextField("Spent name", text: $viewModel.spentName)
                    .textFieldStyle(.automatic)
                    .textFieldStyle(.plain)
                    .textFieldModifier()
                    .foregroundColor(.primaryFont)
                    .onChange(of: viewModel.spentName, perform: { _ in
                        viewModel.filterSpents()
                    })
                    .onSubmit {
                        viewModel.hideKeyboard()
                    }
                
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 1)
                            .fill(
                                LinearGradient(colors: [.walletGradient2, .walletGradient1], startPoint: .topLeading, endPoint: .topTrailing)
                            )
                    }
                
                HStack(spacing: 0){
                    Text("Results for: ")
                        .font(.custom(URBANIST_BOLD, size: 16))
                    
                    Text("\(viewModel.spentName)")
                        .foregroundColor(.remnant)
                        .font(.custom(URBANIST_BOLD, size: 16))
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.filteredSpents, id: \.self){ spent in
                        NavigationLink {
                            CostInformationView(spent: spent, user: viewModel.user)
                        } label: {
                            CostCard(user: $viewModel.user, spent: spent)
                        }
                    }
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .onTapGesture {
            viewModel.hideKeyboard()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
