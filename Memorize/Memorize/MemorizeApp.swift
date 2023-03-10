//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jasmo Two on 16/02/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
          let game = EmojiMemoryGame()
          EmojiMemoryGameView(viewModel: game)
        }
    }
}
