//
//  Salary.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 08/05/22.
//

import SwiftUI

struct Salary: View {
    @EnvironmentObject var viewModel: WalletViewModel
    @State var showTextField: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Salary")
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.secondaryFontColor)
            
            TextField("Type your budget", text: $viewModel.budget)
                .keyboardType(.decimalPad)
                .font(.system(size: 24, weight: .bold, design: .default))
                .foregroundColor(.primaryFont)
        }
    }
}

struct SalaryText: View{
    var body: some View{
        Text("RS4.500,00")
            .font(.system(size: 25, weight: .bold, design: .default))
            .foregroundColor(.primaryFont)
    }
}

struct Salary_Previews: PreviewProvider {
    static var previews: some View {
        Salary()
    }
}
