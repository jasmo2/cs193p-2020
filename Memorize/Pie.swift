//
//  Pie.swift
//  Memorize
//
//  Created by Jasmo Two on 13/03/23.
//

import SwiftUI

struct Pie: Shape {
  var startAngel: Angle
  var endAngel: Angle
  var clockwise: Bool = false

  var animatableData: AnimatablePair<Double, Double> {
    get {
      AnimatablePair(startAngel.radians, endAngel.radians)
    }
    set {
      startAngel = Angle.radians(newValue.first)
      endAngel = Angle.radians(newValue.second)
    }
  }

  func path(in rect: CGRect) -> Path {
    let radius = min(rect.width, rect.height) * 0.5
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let start = CGPoint(
      x: center.x + radius * cos(CGFloat(startAngel.radians)),
      y: center.y + radius * sin(CGFloat(startAngel.radians))
    )
    var p = Path()

    p.move(to: center)
    p.addLine(to: start)
    p.addArc(
      center: center,
      radius: radius,
      startAngle: startAngel,
      endAngle: endAngel,
      clockwise: clockwise
    )

    return p
  }
}
