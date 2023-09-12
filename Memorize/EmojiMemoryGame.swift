//
//  EmojiMemoryGame.swift
//  Memorize - VIEWMODEL
//
//  Created by Nathan on 8/31/23.
//


import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    
    var theme = themes.randomElement()!
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let shuffledEmojis = theme.emojis.shuffled()
        return MemoryGame(numberOfPairsOfCards: theme.numberPairsCards) { pairIndex in
            if shuffledEmojis.indices.contains(pairIndex) {
                return shuffledEmojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    init() {
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    var score: Int { model.score }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    func selectTheme(themeName: String) {
        switch themeName {
            case "Birds":
                theme =  themes[0]
                model = EmojiMemoryGame.createMemoryGame(theme: themes[0])
            case "Ocean":
                theme =  themes[1]
                model = EmojiMemoryGame.createMemoryGame(theme: themes[1])
            case "Foods":
                theme =  themes[2]
                model = EmojiMemoryGame.createMemoryGame(theme: themes[2])
            case "Hearts":
                theme =  themes[3]
                model = EmojiMemoryGame.createMemoryGame(theme: themes[3])
            case "Hands":
                theme =  themes[4]
                model = EmojiMemoryGame.createMemoryGame(theme: themes[4])
            case "Sports":
                theme =  themes[5]
                model = EmojiMemoryGame.createMemoryGame(theme: themes[5])
            default:
                theme =  themes[0]
                model = EmojiMemoryGame.createMemoryGame(theme: themes[0])
        }
    }
}
