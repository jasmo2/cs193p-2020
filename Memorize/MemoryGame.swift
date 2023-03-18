//
//  Memorygame.swift
//  Memorize
//
//  Created by Jasmo Two on 17/02/23.
//

import Foundation
struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>
  
  private var indexOfTheOneAndOnlyFaceUpCard: Int? {
    get {
      cards.indices.filter{ index in
        cards[index].isFacedUp
      }.only
    }
    set {
      for index in cards.indices{
        cards[index].isFacedUp = index == newValue
      }
    }
  }
  
  //Is a copy from the array data sctructure
  mutating func choose(card: Card) {
  
    if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFacedUp, !cards[chosenIndex].isMatched {
      if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
      
        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
          cards[chosenIndex].isMatched = true
          cards[potentialMatchIndex].isMatched = true
        }
        cards[chosenIndex].isFacedUp = true
      } else {
        indexOfTheOneAndOnlyFaceUpCard = chosenIndex
      }
      
    }
  }
  
  init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = Array<Card>()
    
    for pairIndex in 0..<numberOfPairOfCards {
      let content = cardContentFactory(pairIndex)
      
      cards.append(Card(content: content, id: pairIndex*2))
      cards.append(Card(content: content, id: pairIndex*2+1))
    }
    cards.shuffle()
  }
  
  struct Card: Identifiable {
    var isFacedUp: Bool = false
    var isMatched: Bool = false
    var content: CardContent
    var id: Int
  }
}
