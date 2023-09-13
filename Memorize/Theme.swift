//
//  Theme.swift
//  Memorize
//
//  Created by Nathan on 9/11/23.
//

//import Foundation
import SwiftUI

struct Theme: Identifiable {
    var id: Int
    var name: String
    var emojis: Array<String>
    var numberPairsCards: Int
    var cardColor: Color
//    static let all: Array<Theme> = [
//        Theme(id: 1, name: "Birds", emojis: ["🪿", "🦆", "🐥", "🦉", "🦜", "🦅", "🦇", "🐔", "🐦"], numberPairsCards: 8, cardColor: Color.cyan),
//        Theme(id: 2, name: "Ocean", emojis: ["🐙", "🦐", "🪼", "🦞", "🦀", "🐡", "🐠", "🐟", "🐳", "🦈"], numberPairsCards: 8, cardColor: Color.blue),
//        Theme(id: 3, name: "Foods", emojis: ["🍓", "🍋", "🍉", "🍏", "🍑", "🍒", "🥑", "🫒", "🥦"], numberPairsCards: 8, cardColor: Color.green),
//        Theme(id: 4, name: "Hearts", emojis: ["🩷", "❤️", "🧡", "💛", "💚", "🩵", "💙", "💜"], numberPairsCards: 8, cardColor: Color.yellow),
//        Theme(id: 5, name: "Hands", emojis: ["🤞", "👍", "🫰", "✋", "🖖", "👊", "👆", "🤟", "🤙"], numberPairsCards: 6, cardColor: Color.orange),
//        Theme(id: 6, name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🥏", "🎱", "🏉"], numberPairsCards: 6, cardColor: Color.red)
//    ]
}

var themes: Array<Theme> = [
    Theme(id: 1, name: "Birds", emojis: ["🪿", "🦆", "🐥", "🦉", "🦜", "🦅", "🦇", "🐔", "🐦"], numberPairsCards: 8, cardColor: Color.cyan),
    Theme(id: 2, name: "Ocean", emojis: ["🐙", "🦐", "🪼", "🦞", "🦀", "🐡", "🐠", "🐟", "🐳", "🦈"], numberPairsCards: 8, cardColor: Color.blue),
    Theme(id: 3, name: "Foods", emojis: ["🍓", "🍋", "🍉", "🍏", "🍑", "🍒", "🥑", "🫒", "🥦"], numberPairsCards: 8, cardColor: Color.green),
    Theme(id: 4, name: "Hearts", emojis: ["🩷", "❤️", "🧡", "💛", "💚", "🩵", "💙", "💜"], numberPairsCards: 8, cardColor: Color.yellow),
    Theme(id: 5, name: "Hands", emojis: ["🤞", "👍", "🫰", "✋", "🖖", "👊", "👆", "🤟", "🤙"], numberPairsCards: 6, cardColor: Color.orange),
    Theme(id: 6, name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🥏", "🎱", "🏉"], numberPairsCards: 2, cardColor: Color.red)
//    Theme(id: 7, name: "Broken", emojis: ["🤸‍♀️", "🏂"], numberPairsCards: 1, cardColor: Color.black)
]



