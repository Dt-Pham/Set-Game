//
//  Cardify.swift
//  Set-Game
//
//  Created by Duong Pham on 1/2/21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    var thickness: CGFloat
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get {
            rotation
        }
        set {
            rotation = newValue
        }
    }
    
    init(isFaceUp: Bool, isSelected: Bool) {
        rotation = isFaceUp ? 0 : 180
        thickness = isSelected ? 10 * lineWidth : lineWidth
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: thickness)
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius).fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: yAxis)
    }
        
    // MARK: - Drawing constants
    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3
    private let yAxis: (CGFloat, CGFloat, CGFloat) = (0, 1, 0)
}

extension View {
    func cardify(isFaceUp: Bool, isSelected: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp, isSelected: isSelected))
    }
}
