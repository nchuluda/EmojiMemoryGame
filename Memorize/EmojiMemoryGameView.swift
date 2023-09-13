//
//  ContentView.swift
//  Memorize - VIEW
//
//  Created by Nathan on 8/28/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        if !viewModel.gameOver {
            VStack {
                HStack {
                    Text(viewModel.theme.name).font(.largeTitle)
                    Spacer()
                    Text("Score: \(viewModel.score)").font(.largeTitle)
                }
                
                ScrollView { cards.animation(.default, value: viewModel.cards) }
                Spacer()
                Button("New Game") { viewModel.newGame() }
                // Buttons to select new theme
                HStack {
                    ForEach(themes) { theme in
                        Button(theme.name) { viewModel.selectTheme(themeName: theme.name) }
                    }
                }
            } .padding()
            
            // GAME OVER VIEW
        } else {
            VStack {
                Spacer()
                Text("You win! Score: \(viewModel.score)").font(.largeTitle)
                Spacer()
                Button("New Game") { viewModel.newGame() }
                HStack {
                    ForEach(themes) { theme in
                        Button(theme.name) { viewModel.selectTheme(themeName: theme.name) }
                    }
                }
            } .padding()
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(viewModel.theme.cardColor)
    }
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
        
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(card.content).font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                }
                .opacity(card.isFaceUp ? 1 : 0)
                base.fill().opacity(card.isFaceUp ? 0 : 1)
            }
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        }
    }
    
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
