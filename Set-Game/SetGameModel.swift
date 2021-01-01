//
//  SetGameModel.swift
//  Set-Game
//
//  Created by Duong Pham on 1/1/21.
//

import Foundation

struct SetGameModel {
    private var cards: [Card]
    
    init() {
        cards = []
        var id = 0
        for numberOfShapes in 1...3 {
            for color in Color.allCases {
                for shape in Shape.allCases {
                    for shading in Shading.allCases {
                        cards.append(Card(numberOfShapes: numberOfShapes, color: color, shape: shape, shading: shading, id: id))
                        id += 1
                    }
                }
            }
        }
    }
    
    struct Card : Identifiable {
        var numberOfShapes: Int
        var color: Color
        var shape: Shape
        var shading: Shading
        
        var isMatched: Bool = false
        var isSelected: Bool = false
        var isInsideDeck: Bool = true
        
        var id: Int
        
    }
    
    enum Color : CaseIterable {
        case red
        case green
        case purple
    }
    
    enum Shape : CaseIterable {
        case diamond
        case squiggle
        case oval
    }
    
    enum Shading : CaseIterable {
        case solid
        case striped
        case open
    }
}
