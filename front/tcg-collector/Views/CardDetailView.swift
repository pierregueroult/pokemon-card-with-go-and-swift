//
//  CardDetailView.swift
//  tcg-collector
//
//  Created by Pierre Guéroult on 02/11/2024.
//

import SwiftUI

struct CardDetailView: View {
    @Binding var card: Card?
    @Binding var isShowing: Bool
    
    @State private var rotationY: Double = 0
    @State private var rotationZ: Double = 0
    
    @State private var gradientColors: [Color] = [
        Color.purple.opacity(0.3),
        Color.blue.opacity(0.3),
        Color.green.opacity(0.3),
        Color.yellow.opacity(0.3),
        Color.red.opacity(0.3)
    ]
    
    var body: some View {
        if let card = card {
            ZStack {
                AsyncImage(url: URL(string: card.images.large)) { image in
                    image
                        .resizable()
                        .aspectRatio(63/88, contentMode: .fit)
                        .rotation3DEffect(
                            .degrees(rotationY),
                            axis: (x: 0, y: -1, z: 0)
                        )
                        .rotation3DEffect(
                            .degrees(rotationZ),
                            axis: (x: -1, y: 0, z: 0)
                        )
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    // Update drag offset and rotation
                                    rotationY = Double(value.translation.width / 10) // Adjust sensitivity
                                    rotationZ = Double(value.translation.height / 10) // Adjust sensitivity
                                    
                                    // Update gradient colors based on drag offset
                                    let hueChange = Double(value.translation.height) / 200.0
                                    gradientColors = [
                                        Color(hue: min(1, max(0, 0.5 + hueChange)), saturation: 1, brightness: 1).opacity(0.3),
                                        Color(hue: min(1, max(0, 0.6 + hueChange)), saturation: 1, brightness: 1).opacity(0.3),
                                        Color(hue: min(1, max(0, 0.7 + hueChange)), saturation: 1, brightness: 1).opacity(0.3),
                                        Color(hue: min(1, max(0, 0.8 + hueChange)), saturation: 1, brightness: 1).opacity(0.3),
                                        Color(hue: min(1, max(0, 0.9 + hueChange)), saturation: 1, brightness: 1).opacity(0.3)
                                    ]
                                }
                                .onEnded { _ in
                                    withAnimation {
                                        rotationY = 0
                                        rotationZ = 0
                                    }
                                }
                        )
                } placeholder: {
                    ProgressView()
                }
//                AngularGradient(
//                    gradient: Gradient(colors: gradientColors),
//                    center: .center
//                )
//                .aspectRatio(63/88, contentMode: .fit)
//                .allowsHitTesting(false)
//                .rotation3DEffect(
//                    .degrees(rotationY),
//                    axis: (x: 0, y: -1, z: 0)
//                )
//                .rotation3DEffect(
//                    .degrees(rotationZ),
//                    axis: (x: -1, y: 0, z: 0)
//                )
                
            }
            .padding(40)
            
        }
    }
}
