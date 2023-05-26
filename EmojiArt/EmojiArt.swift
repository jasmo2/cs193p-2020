//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by Jasmo Two on 26/05/23.
//

import Foundation

struct EmojiArt {
  var background: URL?
  var emojis = [Emoji]()
  
  struct Emoji: Identifiable {
    fileprivate init(text: String, x:Int, y: Int, size: Int, id: Int) {
      self.text = text
      self.y =  y
      self.x =  x
      self.size =  size
      self.id =  id
    }
    
    let text: String
    var y: Int
    var x: Int
    var size: Int
    var id: Int
  }
  
  private var uniqueEmojiId = 0
  
  mutating func addEmoji(_ text: String, x: Int, y: Int, size: Int){
    uniqueEmojiId += 1
    emojis.append(Emoji( text: text, y: y, x: x, size: size, id: uniqueEmojiId))
  }
}
