//
//  Squiggle.swift
//  Set-Game
//
//  Created by Duong Pham on 1/2/21.
//

import SwiftUI

struct Squiggle: Shape {
    
    func path(in rect: CGRect) -> Path {
        let p1 = CGPoint(x: 0, y: rect.maxY)
        let p2 = CGPoint(x: rect.maxX / 3, y: -rect.maxY / 1.2)
        let p3 = CGPoint(x: rect.maxX * 2 / 3, y: rect.maxY)
        
        let p4 = CGPoint(x: rect.maxX, y: 0)
        let p5 = CGPoint(x: rect.maxX * 2 / 3, y: rect.maxY + rect.maxY / 1.2)
        let p6 = CGPoint(x: rect.maxX / 3, y: 0)
        
        var path = Path()
        path.move(to: p1)
        path.addCurve(to: p4, control1: p2, control2: p3)
        path.addCurve(to: p1, control1: p5, control2: p6)
        
        return path
    }
}
