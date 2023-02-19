//
//  Memorygame.swift
//  Memorize
//
//  Created by Jasmo Two on 17/02/23.
//

import Foundation
struct MemoryGame<CardContent> {
  var cards: Array<Card>
  
  //Is a copy from the array data sctructure
  mutating func choose(card: Card) {
    print("card chosen: \(card)")
//    let chosenIndex: Int = cards.index(of: card)
    let chosenIndex: Int = index(of: card)
    cards[chosenIndex].isFacedUP = !cards[chosenIndex].isFacedUP
    
    
  }
  
  func index(of card: Card) -> Int {
    for index in 0..<cards.count {
      if cards[index].id == card.id {
        return index
      }
    }
    return -1 // TODO: bogus!
  }
  
  init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = Array<Card>()
    
    for pairIndex in 0..<numberOfPairOfCards {
      let content = cardContentFactory(pairIndex)
      
      cards.append(Card(content: content, id: pairIndex*2))
      cards.append(Card(content: content, id: pairIndex*2+1))
    }
  }
  
  struct Card: Identifiable {
    var isFacedUP: Bool = true
    var isMatched: Bool = false
    var content: CardContent
    var id: Int
  }
}
