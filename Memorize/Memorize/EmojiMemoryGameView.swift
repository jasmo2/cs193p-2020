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
    VStack {
      GridStruct(items: viewModel.cards) { card in
        CardView(card: card).onTapGesture {
          perform: do {
            withAnimation(.easeIn(duration: 0.45)) {
              viewModel.choose(card: card)
            }
          }
        }.padding(5)
      }
      .padding()
      .foregroundColor(Color.orange)
      Button(action: {
        withAnimation(.easeInOut(duration: 2)) {
          viewModel.resetGame()
        }
      }, label: { Text("New Game") })
    }
  }
}

struct CardView: View {
  // MARK: - Drawing Constants

  let fontScaleFactor: CGFloat = 0.75

  var card: MemoryGame<String>.Card

  var body: some View {
    GeometryReader { geometry in
      body(for: geometry.size)
    }
  }

  @State private var animatedBonusRemaining: Double = 0

  private func startBonusTimeAnimation() {
    animatedBonusRemaining = card.bonusRemaining
    withAnimation(Animation.linear(duration: card.bonusTimeRemaining)) {
      animatedBonusRemaining = 0
    }
  }

  @ViewBuilder
  func body(for size: CGSize) -> some View {
    if card.isFacedUp || !card.isMatched {
      ZStack {
        Group {
          if card.isConsumingBonusTime {
            Pie(
              startAngel: Angle.degrees(0 - 90),
              endAngel: Angle.degrees((-animatedBonusRemaining) * (360 - 90)),
              clockwise: true
            ).onAppear {
              startBonusTimeAnimation()
            }
          } else {
            Pie(
              startAngel: Angle.degrees(0 - 90),
              endAngel: Angle.degrees((-card.bonusRemaining) * (360 - 90)),
              clockwise: true
            ).opacity(0.4).padding(5)
          }
        }.opacity(0.4).padding(5)
          .transition(AnyTransition.identity)

        Text(card.content)
          .font(
            Font.system(size: fontSize(for: size))
          )
          .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
          .animation(Animation.linear(duration: 0.750).repeatForever(autoreverses: false), value: card.isMatched)
      }
      .cardify(isFacedUp: card.isFacedUp)
      .transition(AnyTransition.scale)
    }
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
