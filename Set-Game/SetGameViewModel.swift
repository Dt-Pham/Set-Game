//
//  SetGameViewModel.swift
//  Set-Game
//
//  Created by Duong Pham on 1/1/21.
//

import Foundation

class SetGameViewModel: ObservableObject {
    @Published private var model: SetGameModel = SetGameModel(numberOfCardsDealed: 12);
    
    // MARK: - Intents
    func newGame() {
        model = SetGameModel(numberOfCardsDealed: 12)
    }
    
    func dealCards() {
        
    }
}
