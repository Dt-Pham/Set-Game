//
//  Diamond.swift
//  Set-Game
//
//  Created by Duong Pham on 1/2/21.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let top = CGPoint(x: rect.midX, y: 0)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)
        let left = CGPoint(x: 0, y: rect.midY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        
        path.move(to: top)
        path.addLine(to: right)
        path.addLine(to: bottom)
        path.addLine(to: left)
        path.addLine(to: top)
        
        return path
    }
}
