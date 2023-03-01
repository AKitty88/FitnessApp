//
//  DropDownView.swift
//  Fitness
//
//  Created by User on 11/2/2023.
//

import SwiftUI

struct DropDownView<T: DropdownItemProtocol>: View {
    @Binding var viewModel: T
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.headerTitle)
                    .font(.system(size: 21, weight: .semibold))
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            Button(action: {
                viewModel.isFirstOptionSelected = true
            }, label: {
                HStack {
                    Text(viewModel.dropdownTitle)
                        .font(.system(size: 28, weight: .semibold))
                    Spacer()
                    Image(systemName: "arrowtriangle.down.circle")
                        .font(.system(size: 24, weight: .medium))
                }
                .padding(.horizontal, 20)
            })
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding(20)
    }
}
