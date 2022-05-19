//
//  CostInformationView.swift
//  finances
//
//  Created by Douglas Henrique de Souza Pereira on 07/05/22.
//

import SwiftUI

struct CostInformationView: View {
    @StateObject var viewModel = CostInformationViewModel()
    @State var showAlert: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var spent: Spent
    
    init(spent: Spent){
        self.spent = spent
    }
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            VStack{
                LinearGradient(colors: [.background, viewModel.categoryColor], startPoint: .bottom, endPoint: .top)
                    .frame(maxWidth: UIScreen.main.bounds.maxX, maxHeight: UIScreen.main.bounds.height/3.5)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack(spacing: 40){
                
                viewModel.categoryIcon
                    .padding(.top, 10)
                    .overlay {
                        //TODO: - Edit Button
                    }
                
                SpentDate()
                    .environmentObject(spent)
                
                SpentPrice()
                    .environmentObject(spent)
                
                Separator()
                
                GraphicInformation()
                    .environmentObject(viewModel)
                
                Spacer()
            }
            .navigationViewStyle(.stack)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        showAlert.toggle()
                    } label: {
                        Image("delete")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text(spent.name ?? "Unknown")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.primaryFont)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.primaryFont)
                    }
                }
            }
        }
        .alert("Attention", isPresented: $showAlert, actions: {
            Button("Remove", role: .destructive, action: {
                viewModel.delete(self.spent)
            })

            Button("Cancel", role: .cancel) {
                
            }
        }, message: {
            Text("Are you sure you want to remove?")
        })
        .onAppear {
            viewModel.getCategory(for: spent.type ?? "")
            viewModel.chooseCategoryPack()
            viewModel.getUser()
            viewModel.calculatePercentage(with: spent.cost)
        }
    }
}

struct SpentDate: View{
    @EnvironmentObject var spent: Spent
    
    var body: some View{
        Label {
            Text(Date.monthYearFormat(spent.date ?? .now))
                .font(.system(size: 20, weight: .regular, design: .default))
                .foregroundColor(.secondaryFontColor)
        } icon: {
            Image("date")
                .resizable()
                .frame(width: 24, height: 24)
        }
        .padding(.top, 20)
    }
}

struct SpentPrice: View{
    @EnvironmentObject var spent: Spent
    
    var body: some View{
        VStack{
            
            Text("Price")
                .font(.system(size: 12, weight: .semibold, design: .default))
                .foregroundColor(.primaryFont)
            
            Text(String(format: "R$%.2f", spent.cost))
                .font(.system(size: 25, weight: .semibold, design: .default))
                .foregroundColor(.spent)
        }
    }
}

struct GraphicInformation: View{
    @State var progress: CGFloat = 0
    @EnvironmentObject var viewModel: CostInformationViewModel
    
    var body: some View{
        VStack{
            
            ZStack{
                ProgressBar(progress: $progress, color: viewModel.categoryColor)
                    .frame(width: 175.0, height: 175.0)
                    .padding(.top, 20)
                
                Text(String(format: "%.0f%", viewModel.percentage))
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundColor(.primaryFont)
                    .frame(maxWidth: 86)
                    .multilineTextAlignment(.center)
            }
            
            Text("This value use 0,2% of your total budget!")
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(.primaryFont)
                .frame(maxWidth: UIScreen.main.bounds.maxX/1.5)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
        }
    }
}
