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
        Group {
            switch card.symbol {
            case .diamond:
                Diamond().stripe().stroke(lineWidth: 2)
            case .squiggle:
                Squiggle().stripe().stroke(lineWidth: 2)
            case .oval:
                RoundedRectangle(cornerRadius:10).stripe().stroke(lineWidth: 2)
            }
        }
            .aspectRatio(16/9, contentMode: .fit)
            .padding()
            .cardify(isFaceUp: true)
            .foregroundColor(.red)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(viewModel: SetGameViewModel())
    }
}
