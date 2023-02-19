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
    return HStack(){
      ForEach(viewModel.cards) { card in
        CardView(card: card).onTapGesture {
        perform: do {
          viewModel.choose(card: card)
        }
        }
      }
      
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
      self.body(for: geometry.size)
    }
    
  }
  
  func body(for size: CGSize) -> some View {
    ZStack() {
      if card.isFacedUP {
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
        Text(card.content)
      } else {
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
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello there, world!")
//        }
//        .padding()
//   }

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    EmojiMemoryGameView(viewModel: game)
  }
}






