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
                NavigationHeader()
                
                SearchTextField()
                    .environmentObject(viewModel)
                
                SearchString()
                    .environmentObject(viewModel)
                
                SearchResults()
                    .environmentObject(viewModel)
            }
            .padding()
        }
        .onTapGesture {
            viewModel.hideKeyboard()
        }
    }
}

struct NavigationHeader: View{
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        HStack{
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
            }
            .foregroundColor(Color.primaryFont)
        }
        .padding(.bottom, 15)
    }
}

struct SearchResults: View{
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View{
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
}

struct SearchString: View{
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View{
        HStack(spacing: 0){
            Text("Results for: ")
                .font(.custom(URBANIST_BOLD, size: 16))
            
            Text("\(viewModel.spentName)")
                .foregroundColor(.remnant)
                .font(.custom(URBANIST_BOLD, size: 16))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
