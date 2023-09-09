//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nathan on 8/31/23.
//

import SwiftUI

let birds = ["🪿", "🦆", "🐥", "🦉", "🦜", "🦅", "🦇", "🐔", "🐦"]
let foods = ["🍓", "🍋", "🍉", "🍏", "🍑", "🍒", "🥑", "🫒", "🥦"]
let sports = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🥏", "🎱", "🏉"]
let hearts = ["🩷", "❤️", "🧡", "💛", "💚", "🩵", "💙", "💜"]
let hands = ["🤞", "👍", "🫰", "✋", "🖖", "👊", "👆", "🤟", "🤙"]
let ocean = ["🐙", "🦐", "🪼", "🦞", "🦀", "🐡", "🐠", "🐟", "🐳", "🦈"]

class EmojiMemoryGame: ObservableObject {
    private static func createMemoryGame(emojis: Array<String>, count: Int) -> MemoryGame<String> {
        let shuffled = emojis.shuffled()
        return MemoryGame(numberOfPairsOfCards: count) { pairIndex in
            if shuffled.indices.contains(pairIndex) {
                return shuffled[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame(emojis: ocean, count: 8)
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
//    func newGame() {
//        model = EmojiMemoryGame.createMemoryGame(emojis: birds)
//        model.shuffle()
//    }
    
    func theme(theme: Array<String>) {
        switch theme {
        case birds:
            model = EmojiMemoryGame.createMemoryGame(emojis: birds, count: 8)
            model.shuffle()
        case foods:
            model = EmojiMemoryGame.createMemoryGame(emojis: foods, count: 8)
            model.shuffle()
        case sports:
            model = EmojiMemoryGame.createMemoryGame(emojis: sports, count: 6)
            model.shuffle()
        case hearts:
            model = EmojiMemoryGame.createMemoryGame(emojis: hearts, count: 8)
            model.shuffle()
        case hands:
            model = EmojiMemoryGame.createMemoryGame(emojis: hands, count: 8)
            model.shuffle()
        case ocean:
            model = EmojiMemoryGame.createMemoryGame(emojis: ocean, count: 8)
            model.shuffle()
        default:
            model = EmojiMemoryGame.createMemoryGame(emojis: birds, count: 8)
            model.shuffle()
        }
    }
}
