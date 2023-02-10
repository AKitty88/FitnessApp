//
//  PrimaryButtonStyle.swift
//  Fitness
//
//  Created by User on 10/2/2023.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    var fillColour: Color = .darkPrimaryButtonColour
    
    func makeBody(configuration: Configuration) -> some View {
        return PrimaryButton(configuration: configuration, fillColour: fillColour)
    }
    
    struct PrimaryButton: View {
        let configuration: Configuration
        let fillColour: Color
        
        var body: some View {
            return configuration.label
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(fillColour)
                )
        }
    }
}

struct PrimaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Create a challenge")
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}
