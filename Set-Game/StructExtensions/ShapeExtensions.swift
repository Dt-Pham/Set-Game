//
//  ShapeExtensions.swift
//  Set-Game
//
//  Created by Duong Pham on 1/3/21.
//

import SwiftUI

extension Shape {
    func stripe(n: Int = 10) -> some Shape {
        return StripedShape(pathGenerator: self.path)
    }
}
