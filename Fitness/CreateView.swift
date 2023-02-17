//
//  CreateView.swift
//  Fitness
//
//  Created by User on 11/2/2023.
//

import SwiftUI

struct CreateView: View {
    @State private var isActive = false
    var body: some View {
        ScrollView {
            VStack {
                DropDownView(dropDownText: "Roll up")
                DropDownView(dropDownText: "Roll over")
                DropDownView(dropDownText: "One Leg Circle")
                DropDownView(dropDownText: "One Leg Stretch")
                Spacer()
            }
            .navigationBarTitle("Create")
            .navigationBarBackButtonHidden(true)
        }
    }
}
