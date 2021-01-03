//
//  Diamond.swift
//  Set-Game
//
//  Created by Duong Pham on 1/2/21.
//

import SwiftUI

struct Diamond: Shape {
    var ratio: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var p = rect.height
        var q = p * ratio
        if q > rect.width {
            q = rect.width
            p = q / ratio
        }
        
        var path = Path()
        let top = CGPoint(x: rect.midX, y: rect.midY - p/2)
        let bottom = CGPoint(x: rect.midX, y: rect.midY + p/2)
        let left = CGPoint(x: rect.midX - q/2, y: rect.midY)
        let right = CGPoint(x: rect.midX + q/2, y: rect.midY)
        
        path.move(to: top)
        path.addLine(to: right)
        path.addLine(to: bottom)
        path.addLine(to: left)
        path.addLine(to: top)
        
        return path
    }
}
