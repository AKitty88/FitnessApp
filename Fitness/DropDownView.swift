//
//  DropDownView.swift
//  Fitness
//
//  Created by User on 11/2/2023.
//

import SwiftUI

struct DropDownView: View {
    var dropDownText: String
    
    init(dropDownText: String) {
        self.dropDownText = dropDownText
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Pilates")
                    .font(.system(size: 21, weight: .semibold))
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            Button(action: {}, label: {
                HStack {
                    Text(dropDownText)
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

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DropDownView(dropDownText: "Roll up")
        }
        NavigationView {
            DropDownView(dropDownText: "Roll over")
        }
        .environment(\.colorScheme, .dark)
    }
}
