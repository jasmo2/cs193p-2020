//
//  Cardify.swift
//  Memorize
//
//  Created by Jasmo Two on 13/03/23.
//

import SwiftUI

struct Cardify: AnimatableModifier {
  var rotation: Double
  
  init(isFacedUp: Bool) {
    rotation = isFacedUp ? 0 : 180
  }
  
  var isFacedUp: Bool {
    rotation < 90
  }
  
  var animatableData: Double {
    get {return rotation }
    set {rotation = newValue}
  }
  
  func body(content: Content) -> some View {
    ZStack {
      Group { 
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
        content
      } .opacity(isFacedUp ? 1 : 0)
      
      RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
        .opacity(isFacedUp ? 0 : 1)
      
    }
    .rotation3DEffect(
      Angle.degrees(rotation),
      axis: (x: 0.0, y: 1.0, z: 0.0)
    )
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
