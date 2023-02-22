//
//  Array+Only.swift
//  Memorize
//
//  Created by Jasmo Two on 21/02/23.
//

import Foundation

extension Array {
  var only: Element? {
    count == 1 ? first : nil
  }
}
