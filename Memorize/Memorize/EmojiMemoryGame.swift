//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jasmo Two on 17/02/23.
//

import SwiftUI

func createCardContent(pairIndex: Int) -> String {
  return "🤭"
}

class EmojiMemoryGame: ObservableObject {
  //Glass Door
  @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
  
  private static func createMemoryGame()-> MemoryGame<String> {
    let emojis = ["👻", "🎃", "🕷️"]
    return MemoryGame<String>(numberOfPairOfCards: emojis.count) { pairIndex in emojis[pairIndex]}
  }
    
  // MARK: - Access to Model
  // video intercom
  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
  // MARK: - intent(s)
  func choose(card: MemoryGame<String>.Card){
    model.choose(card: card)
  }
  
  func resetGame() {
      model = EmojiMemoryGame.createMemoryGame()
  }
}
