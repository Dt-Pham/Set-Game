//
//  Shake.swift
//  Set-Game
//
//  Created by Duong Pham on 1/5/21.
//

import SwiftUI

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit: CGFloat = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * shakesPerUnit), y: 0))
    }
}

extension View {
    func shake(animatableData: CGFloat) -> some View {
        self.modifier(Shake(animatableData: animatableData))
    }
}
