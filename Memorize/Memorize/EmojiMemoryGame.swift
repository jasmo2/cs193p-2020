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

class EmojiMemoryGame {
  //Glass Door
  //  private(set) var model: MemoryGame<String>
  private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
  
  static func createMemoryGame()-> MemoryGame<String> {
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
}
