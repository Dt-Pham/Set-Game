//
//  SetGameView.swift
//  Set-Game
//
//  Created by Duong Pham on 1/1/21.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var viewModel: SetGameViewModel
    
    var body: some View {
        Button("New Game") {
            print("new game")
            viewModel.newGame()
        }
        Grid(items: viewModel.cardsOnScreen) { card in
            CardView(card: card)
                .padding(paddingLength)
        }
    }
    
    // MARK: - Drawing constants
    let paddingLength: CGFloat = 5
}

struct CardView: View {
    var card: SetGameModel.Card
    var body: some View {
        Diamond(ratio: 3/2).cardify(isFaceUp: true)
            .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(viewModel: SetGameViewModel())
    }
}
