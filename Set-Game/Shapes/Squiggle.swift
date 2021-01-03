//
//  Squiggle.swift
//  Set-Game
//
//  Created by Duong Pham on 1/2/21.
//

import SwiftUI

struct Squiggle: Shape {
    var isStriped: Bool = true
    
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
        
        var path2 = Path()
        path2.move(to: p1)
        path2.addCurve(to: p4, control1: p2, control2: p3)
        path2.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path2.addLine(to: p1)
        
        if isStriped {
            let n = 10
            var startY = [CGFloat](repeating: 0, count: n)
            var endY = [CGFloat](repeating: 0, count: n)
            
            for i in 1..<n {
                let r: CGFloat = CGFloat(i) / CGFloat(n)
                
                var lo: CGFloat = 0
                var hi: CGFloat = rect.maxY
                
                for _ in 0..<100 {
                    let mid = (lo + hi) / 2
                    if path2.contains(CGPoint(x: rect.maxX * r, y: mid)) {
                        hi = mid
                    }
                    else {
                        lo = mid
                    }
                }
                startY[i] = lo
                endY[n-i] = 2 * rect.midY - lo
            }
            
            for i in 1..<n {
                let r: CGFloat = CGFloat(i) / CGFloat(n)
                let startPoint = CGPoint(x: rect.maxX * r, y: startY[i])
                let endPoint = CGPoint(x: rect.maxX * r, y: endY[i])
                path.move(to: startPoint)
                path.addLine(to: endPoint)
            }
        }
        
        return path
    }
}
