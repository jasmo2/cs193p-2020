//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jasmo Two on 16/02/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    
    GridStruct(items: viewModel.cards) { card in
      CardView(card: card).onTapGesture {
        perform: do {
          viewModel.choose(card: card)
        }
      }.padding(5)
    }
    .padding()
    .foregroundColor(Color.orange)
    
  }
}

struct CardView: View {
  // MARK: - Drawing Constants
  let cornerRadius: CGFloat = 10
  let edgeLineWidth : CGFloat = 3
  let fontScaleFactor: CGFloat = 0.75
  
  var card: MemoryGame<String>.Card
  
  var body: some View {
    GeometryReader { geometry in
      body(for: geometry.size)
    }
    
  }
  
  func body(for size: CGSize) -> some View {
    ZStack() {
      if card.isFacedUP {
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
        Pie(startAngel: Angle.degrees(0-90), endAngel: Angle.degrees(110-90), clockwise: true)
          .opacity(0.4).padding(5)
        Text(card.content)
      } else if !card.isMatched{
          RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
      }
    }
    .font(
      Font.system(size: fontSize(for: size))
    )
  }

  func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * fontScaleFactor
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    game.choose(card: game.cards[0])
    return EmojiMemoryGameView(viewModel: game)
  }
}






