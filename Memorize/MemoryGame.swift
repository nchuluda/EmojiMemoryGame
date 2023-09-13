//
//  MemorizeGame.swift
//  Memorize - MODEL
//
//  Created by Nathan on 8/31/23.
//
import SwiftUI
import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score = 0
    private(set) var cardsRemaining: Int
    private(set) var gameOver = false
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        cards.shuffle()
        cardsRemaining = cards.count
    }
    
    var indexOfSingleFaceUpCard: Int? {
        get { return cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            
            // Only increment timesFlipped if card clicked is face down
            if cards[chosenIndex].isFaceUp == false {
                cards[chosenIndex].timesFlipped += 1
                print(cards[chosenIndex].timesFlipped)
            }

            // Card is face down AND Card is not matched
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                
                // Index of first card chosen
                if let potentialMatchIndex = indexOfSingleFaceUpCard {
                    
                    // Emojis on the two cards match
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        
                        // Found match - mark as matched and increase score by 2
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2
                        print("Match! +2 points")
                        print("Score: \(score)")
                        
                        cardsRemaining -= 2
                        print("Number of cards remaining: \(cardsRemaining)")
                        if cardsRemaining == 0 {
//                            cards[chosenIndex].isFaceUp = true
                            gameOver = true
                            print("You've won! Score: \(score)")
                        }
                        
                        
                    // One card has already been seen, lose one point for penalty
                    } else if cards[chosenIndex].timesFlipped > 1 && cards[potentialMatchIndex].timesFlipped <= 1 {
                        score -= 1
                        print("Oops! -1 point")
                        print("Score: \(score)")
                    } else if cards[chosenIndex].timesFlipped <= 1 && cards[potentialMatchIndex].timesFlipped > 1 {
                        score -= 1
                        print("Oops! -1 point")
                        print("Score: \(score)")
                    // Both cards have already been seen, lose two points for penalty
                    } else if cards[chosenIndex].timesFlipped > 1 && cards[potentialMatchIndex].timesFlipped > 1 {
                        score -= 2
                        print("Oops! -2 points")
                        print("Score: \(score)")
                    }
                    
                } else {
                    // Flip both cards face down and select a new card
                    indexOfSingleFaceUpCard = chosenIndex
                    
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        var timesFlipped = 0
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
