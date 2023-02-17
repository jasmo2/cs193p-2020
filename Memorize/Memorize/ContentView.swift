//
//  ContentView.swift
//  Memorize
//
//  Created by Jasmo Two on 16/02/23.
//

import SwiftUI

struct ContentView: View {
  var viewModel: EmojiMemoryGame
  
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
    .font(Font.largeTitle)
    
  }
}

struct CardView: View {
  var card: MemoryGame<String>.Card
  
  var body: some View {
    return ZStack() {
      if card.isFacedUP {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
        Text(card.content)
      } else {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
      }
    }
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
//    }





struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    ContentView(viewModel: game)
  }
}
