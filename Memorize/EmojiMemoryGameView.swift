//
//  ContentView.swift
//  Memorize
//
//  Created by Nathan on 8/28/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
//    let birds = ["🪿", "🦆", "🐥", "🦉", "🦜"]
//    let foods = ["🍓", "🍋", "🍉", "🍏", "🍑", "🍒"]
//    let sports = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🥏", "🎱"]
//
//    @State var emojiPack: [String] = ["🪿", "🪿", "🦆", "🦆", "🐥", "🐥", "🦉", "🦉", "🦜", "🦜"]
//    @State var cardCount: Int = 10
    @State var themeEmojis: Array<String> = birds
    @State var themeColor: Color = .cyan
    @State var themeName: String = "Birds"
    
    var body: some View {
        VStack {
            Text(themeName).font(.largeTitle)
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
//            HStack {
//                Button("Shuffle") {
//                    viewModel.shuffle()
//                }
//                Spacer()
//                Button("New Game") {
//                    viewModel.newGame()
//                    style(name: "Bird Match", color: .cyan, emojis: birds)
//                }
//            }
//          Spacer()
            themeSelector
//            HStack {
//                Button("Birds") {
//                    viewModel.theme(theme: birds)
//                }
//                Button("Foods") {
//                    viewModel.theme(theme: foods)
//                }
//                Button("Hands") {
//                    viewModel.theme(theme: hands)
//                }
//                Button("Hearts") {
//                    viewModel.theme(theme: hearts)
//                }
//                Button("Ocean") {
//                    viewModel.theme(theme: ocean)
//                }
//                Button("Sports") {
//                    viewModel.theme(theme: sports)
//                }
//            }
        }
        .padding()
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
        .foregroundColor(themeColor)
    }
    
    var themeSelector: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                style(name: themeName, label: "New Game", color: themeColor, emojis: themeEmojis)
            }
            Spacer().frame(height: 30)
            HStack(alignment: .lastTextBaseline) {
                style(name: "Birds", label: "Birds", color: .cyan, emojis: birds)
                style(name: "Ocean", label: "Ocean", color: .blue, emojis: ocean)
                style(name: "Foods", label: "Foods", color: .green, emojis: foods)
                style(name: "Hearts", label: "Hearts", color: .yellow, emojis: hearts)
                style(name: "Hands", label: "Hands", color: .orange, emojis: hands)
                style(name: "Sports", label: "Sports", color: .red, emojis: sports)
            }
        }
    }
    
    func style(name: String, label: String, color: Color, emojis: Array<String>) -> some View {
        VStack {
//            Image(systemName: icon).font(.title2)
            Button(action: {
                themeColor = color
                themeName = name
                themeEmojis = emojis
                viewModel.theme(theme: emojis)
            }, label: {
                Text(label).font(.body)
            })
        }
    }
    
    
//    var cardCountAdjusters: some View {
//        HStack {
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
//
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//            cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
//
//    var cardAdder: some View {
//        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
//    }
}

struct CardView: View {
//    let content: String
//    @State var isFaceUp = false
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
//        .onTapGesture {
//            isFaceUp.toggle()
//        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
