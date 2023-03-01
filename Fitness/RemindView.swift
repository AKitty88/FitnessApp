//
//  RemindView.swift
//  Fitness
//
//  Created by User on 14/2/2023.
//

import SwiftUI

struct RemindView: View {
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Button(
                action: {},
                label: {
                    Text("Create")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.blue)
            })
            .padding(.bottom, 15)
            Button(
                action: {},
                label: {
                    Text("Skip")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.blue)
            })
        }
        .navigationTitle("Remind")
    }
}

struct RemindView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RemindView()
        }
    }
}
