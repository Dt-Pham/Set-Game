//
//  StripedShape.swift
//  Set-Game
//
//  Created by Duong Pham on 1/3/21.
//

import SwiftUI

struct StripedShape : Shape {
    var pathGenerator: (CGRect) -> Path
    func path(in rect: CGRect) -> Path {
        let n = 10
        let boundary = pathGenerator(rect)
        var path = boundary
        for i in 1..<n {
            let r: CGFloat = CGFloat(i) / CGFloat(n)
            
            var lo: CGFloat = 0
            var hi: CGFloat = rect.maxY
            
            while !boundary.contains(CGPoint(x: rect.maxX * r, y: lo)) {
                lo += 1
            }
            while !boundary.contains(CGPoint(x: rect.maxX * r, y: hi)) {
                hi -= 1
            }
            let startPoint = CGPoint(x: rect.maxX * r, y: lo)
            let endPoint = CGPoint(x: rect.maxX * r, y: hi)
            path.move(to: startPoint)
            path.addLine(to: endPoint)
        }
        return path
    }
}
