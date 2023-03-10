//
//  CreateView.swift
//  Fitness
//
//  Created by User on 11/2/2023.
//

import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = CreateChallengeViewModel()
    @State private var isActive = false
    
    var dropdownList: some View {
        ForEach(viewModel.dropdowns.indices, id: \.self) { index in
            DropDownView(viewModel: $viewModel.dropdowns[index])
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                dropdownList
                Spacer()
                NavigationLink(destination: RemindView(), isActive: $isActive) {
                    Button(
                        action: { isActive = true},
                        label: {
                            Text("Next")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(.blue)
                        })
                }
            }
            .actionSheet(isPresented: Binding<Bool>(get: {
                viewModel.hasSelectedDropdown
            }, set: {_ in }), content: { () -> ActionSheet in
                ActionSheet(
                    title: Text("Select"),
                    buttons: viewModel.displayedOptions.indices.map { index in
                        let option = viewModel.displayedOptions[index]
                        return ActionSheet.Button.default(Text(option.formatted), action: {
                            viewModel.send(action: .selectOption(index: index))
                        })
                    }
            )})
            .navigationBarTitle("Create")
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 15)
        }
    }
}
