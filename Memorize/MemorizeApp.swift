//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nathan on 8/28/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
//    @StateObject var game = EmojiMemoryGame()
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
