//
//  Cardify.swift
//  Memorize
//
//  Created by Jasmo Two on 13/03/23.
//

import SwiftUI

struct Cardify: ViewModifier {
  var isFacedUp: Bool
  
  func body(content: Content) -> some View {
    ZStack {
      if isFacedUp {
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
        content
      } else {
        //if !card.isMatched{
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
      }
    }
  }
  // MARK: - Drawing Constants
  let cornerRadius: CGFloat = 10
  let edgeLineWidth : CGFloat = 3
}

extension View {
  func cardify(isFacedUp: Bool) -> some View {
    modifier(Cardify(isFacedUp: isFacedUp))
  }
}
