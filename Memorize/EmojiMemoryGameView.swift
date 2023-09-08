//
//  ContentView.swift
//  Memorize
//
//  Created by Nathan on 8/28/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    let birds = ["🪿", "🪿", "🦆", "🦆", "🐥", "🐥", "🦉", "🦉", "🦜", "🦜"]
    let foods = ["🍓", "🍓", "🍋", "🍋", "🍉", "🍉", "🍏", "🍏", "🍑", "🍑", "🍒", "🍒"]
    let sports = ["⚽️", "⚽️", "🏀", "🏀", "🏈", "🏈", "⚾️", "⚾️", "🎾", "🎾", "🥏", "🥏", "🎱", "🎱"]
    
    
    
    @State var emojiPack: [String] = ["🪿", "🪿", "🦆", "🦆", "🐥", "🐥", "🦉", "🦉", "🦜", "🦜"]
    @State var cardCount: Int = 10
    @State var themeColor: Color = .blue
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            themeSelector
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
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
        HStack(alignment: .lastTextBaseline) {
            theme(theme: birds.shuffled(), icon: "bird", name: "Birds", tCardCount: birds.count, color: .blue)
            theme(theme: foods.shuffled(), icon: "carrot", name: "Foods", tCardCount: foods.count, color: .green)
            theme(theme: sports.shuffled(), icon: "figure.basketball", name: "Sports", tCardCount: sports.count, color: .red)
        }
    }
    
    func theme(theme: [String], icon: String, name: String, tCardCount: Int, color: Color) -> some View {
        VStack {
            Image(systemName: icon).font(.title2)
            Button(action: {
                emojiPack = theme
                cardCount = tCardCount
                themeColor = color
            }, label: {
                Text(name).font(.body)
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
