//
//  LandingView.swift
//  Fitness
//
//  Created by User on 8/2/2023.
//

import SwiftUI

struct LandingView: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer().frame(
                        height: geometry.size.height * 0.70
                    )
                    Text("Fit Me")
                        .font(.system(
                            size: 64,
                            weight: .medium
                        ))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: CreateView(), isActive: $isActive) {
                        Button(action: {
                            isActive = true
                        }, label: {
                            HStack(spacing: 15) {
                                Spacer()
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                Text("Create a challenge")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        })
                        .padding(.horizontal, 15)
                        .buttonStyle(PrimaryButtonStyle())
                    }
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(
                    Image("Pilates")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(.black.opacity(0.4))
                        .frame(width: geometry.size.width)
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
