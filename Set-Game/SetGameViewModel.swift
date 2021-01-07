//
//  SetGameViewModel.swift
//  Set-Game
//
//  Created by Duong Pham on 1/1/21.
//

import Foundation

class SetGameViewModel: ObservableObject {
    @Published private var model: SetGameModel = SetGameModel(numberOfCardsDealed: 12);
    
    
    // MARK: - Access
    var cardsOnScreen: [SetGameModel.Card] {
        model.cards.filter { card in
            !card.isMatched && card.isDealt
        }
    }
    
    var numberOfSelectedCards: Int {
        model.indicesOfSelectedCards.count
    }
    
    // MARK: - Intents
    func newGame() {
        model = SetGameModel(numberOfCardsDealed: 12)
    }
    
    func dealCards() {
        model.dealCards()
    }
    
    func chooseCard(card: SetGameModel.Card) {
        if card.isSelected {
            model.deselect(card: card)
        }
        else {
            model.select(card: card)
        }
    }
    
    func check() {
        print("View Model: check()")
        model.check()
    }
}
