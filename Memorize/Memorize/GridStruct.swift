//
//  GridStruct.swift
//  Memorize
//
//  Created by Jasmo Two on 19/02/23.
//

import SwiftUI

struct GridStruct<Item, ItemView>: View where Item: Identifiable, ItemView: View {
  var items: [Item]
  var viewForItem: (Item) -> ItemView
  
  init(items: [Item], viewForItem: @escaping (Item) -> ItemView) {
    self.items = items
    self.viewForItem = viewForItem
  }
  var body: some View {
    GeometryReader{geometry in
      let layout: GridLayout = GridLayout(itemCount: items.count, in: geometry.size)
      ForEach(items){ item in
//        let index: Int = index(of: item)
        let index = items.firstIndex(matching: item)!
        viewForItem(item)
          .frame(
            width: layout.itemSize.width,
            height: layout.itemSize.height
          )
          .position(layout.location(ofItemAt: index))
      }
    }
  }
}
