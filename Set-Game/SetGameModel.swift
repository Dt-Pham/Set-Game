//
//  SetGameModel.swift
//  Set-Game
//
//  Created by Duong Pham on 1/1/21.
//

import Foundation

struct SetGameModel {
    var cards: [Card]
    var indicesOfSelectedCards: [Int]
    var indicesOfHintedCards: [Int]
    
    init(numberOfCardsDealed: Int) {
        cards = []
        var id = 0
        for numberOfShapes in 1...3 {
            for color in Color.allCases {
                for symbol in Symbol.allCases {
                    for shading in Shading.allCases {
                        cards.append(Card(numberOfShapes: numberOfShapes, color: color, symbol: symbol, shading: shading, id: id))
                        id += 1
                    }
                }
            }
        }
        cards.shuffle()
        for i in 0..<numberOfCardsDealed {
            cards[i].isDealt = true
        }
        indicesOfSelectedCards = []
        indicesOfHintedCards = [0]
    }
    
    // MARK: - Intents
    mutating func select(card: Card) {
        assert(!card.isSelected && card.isDealt && !card.isMatched)
        print("selected card: \(card)")
        
        let index = cards.firstIndex(matching: card)!
        cards[index].isSelected = true
        indicesOfSelectedCards.append(index)
    }
    
    mutating func check() {
        if indicesOfSelectedCards.count == 3 {
            if checkCardsAreMatched() {
                print("Cards are matched")
                removeMatchedCards()
                indicesOfSelectedCards.removeAll()
                dealCards()
            }
            else {
                print("Cards aren't matched")
                for i in 0..<3 {
                    let index = indicesOfSelectedCards[i]
                    cards[index].isSelected = false
                }
                indicesOfSelectedCards.removeAll()
            }
        }
    }
    
    mutating func deselect(card: Card) {
        if indicesOfSelectedCards.count < 3 {
            assert(card.isSelected && card.isDealt && !card.isMatched)
            
            print("deselect card: \(card)")
            let index = cards.firstIndex(matching: card)!
            cards[index].isSelected = false
            indicesOfSelectedCards = indicesOfSelectedCards.filter{$0 != index}
        }
    }
    
    mutating func dealCards(amount: Int = 3) {
        var indicesOfCardsInDeck = [Int]()
        for i in 0..<cards.count {
            if !cards[i].isDealt && indicesOfCardsInDeck.count < amount {
                indicesOfCardsInDeck.append(i)
            }
        }
        if indicesOfCardsInDeck.count < amount {
            print("No more cards")
            return
        }
        for i in 0..<amount {
            let index = indicesOfCardsInDeck[i]
            cards[index].isDealt = true
        }
    }
    
    private func checkCardsAreMatched() -> Bool {
        assert(indicesOfSelectedCards.count == 3)
        let card1 = cards[indicesOfSelectedCards[0]]
        let card2 = cards[indicesOfSelectedCards[1]]
        let card3 = cards[indicesOfSelectedCards[2]]
        
        if (card1.numberOfShapes + card2.numberOfShapes + card3.numberOfShapes) % 3 != 0 {
            return false
        }
        if (card1.color.rawValue + card2.color.rawValue + card3.color.rawValue) % 3 != 0 {
            return false
        }
        if (card1.symbol.rawValue + card2.symbol.rawValue + card3.symbol.rawValue) % 3 != 0 {
            return false
        }
        if (card1.shading.rawValue + card2.shading.rawValue + card3.shading.rawValue) % 3 != 0 {
            return false
        }
        return true
    }
    
    private mutating func removeMatchedCards() {
        assert(indicesOfSelectedCards.count == 3 && checkCardsAreMatched())
        for i in 0..<3 {
            let index = indicesOfSelectedCards[i]
            cards[index].isMatched = true
        }
    }
    
    
    struct Card : Identifiable {
        var numberOfShapes: Int
        var color: Color
        var symbol: Symbol
        var shading: Shading
        
        var isMatched: Bool = false
        var isSelected: Bool = false
        var isDealt: Bool = false
        var isHinted: Bool = false
        
        var id: Int
    }
    
    enum Color : Int, CaseIterable {
        case red = 0
        case green = 1
        case purple = 2
    }
    
    enum Symbol : Int, CaseIterable {
        case diamond = 0
        case squiggle = 1
        case oval = 2
    }
    
    enum Shading : Int, CaseIterable {
        case solid = 0
        case striped = 1
        case open = 2
    }
}
