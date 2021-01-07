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
        GeometryReader { geometry in
            body(size: geometry.size)
        }
    }
    
    private func body(size: CGSize) -> some View {
        DispatchQueue.main.async {
            if viewModel.numberOfSelectedCards == 3 {
                Thread.sleep(forTimeInterval: 0.5)
                withAnimation(Animation.linear(duration: 0.5)) {
                    viewModel.check()
                }
            }
        }
        
        return VStack {
            // new game button
            Button {
                print("new game")
                viewModel.newGame()
            } label: {
                Text("New Game")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(40)
            }
            .frame(width: size.width, height: size.height/20, alignment: Alignment.bottomLeading)
            
            // cards
            Grid(items: viewModel.cardsOnScreen, nearAspectRatio: 1/2) { card in
                CardView(card: card).onTapGesture {
                    viewModel.chooseCard(card: card)
                }
            }
            
            HStack {
                // deal cards button
                Group {
                    Button {
                        viewModel.dealCards()
                    } label: {
                        Text("Deal 3 cards")
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .font(.title)
                            .cornerRadius(40)
                    }
                }
                .frame(alignment: .bottomTrailing)
                
                // deck
                Text("this is a deck").cardify(isFaceUp: true, isSelected: false, aspectRatio: 1/2)
                    .frame(width: size.width / 2, height: size.height / 4, alignment: .topTrailing)
            }
        }
    }
    
    // MARK: - Drawing constants
    let paddingLength: CGFloat = 5
}

struct CardView: View {
    var correctMatched: Bool?
    var card: SetGameModel.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(size: geometry.size)
        }
        .padding(5)
    }
    
    private func body(size: CGSize) -> some View {
        VStack {
            ForEach(0..<card.numberOfShapes) { index in
                cardContent()
                    .aspectRatio(16/9, contentMode: .fit)
                    .frame(width: size.width/1.2, height: size.height / 8)
            }
        }
        .cardify(isFaceUp: true, isSelected: card.isSelected, aspectRatio: 1/2)
        .shake(animatableData: CGFloat(card.isSelected ? 1 : 0))
        .foregroundColor(color)
    }
    
    func cardContent() -> some View {
        Group {
            switch card.symbol {
            case .diamond:
                switch card.shading {
                case .open:
                    Diamond().stroke(lineWidth: 2)
                case .solid:
                    Diamond()
                case .striped:
                    Diamond().stripe().stroke(lineWidth: 2)
                }
            case .squiggle:
                switch card.shading {
                case .open:
                    Squiggle().stroke(lineWidth: 2)
                case .solid:
                    Squiggle()
                case .striped:
                    Squiggle().stripe().stroke(lineWidth: 2)
                }
            case .oval:
                switch card.shading {
                case .open:
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2)
                case .solid:
                    RoundedRectangle(cornerRadius: 10)
                case .striped:
                    RoundedRectangle(cornerRadius: 10).stripe().stroke(lineWidth: 2)
                }
            }
        }
    }
    
    var color: Color {
        switch card.color {
        case .green:
            return Color.green
        case .red:
            return Color.red
        case .purple:
            return Color.purple
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(viewModel: SetGameViewModel())
    }
}
