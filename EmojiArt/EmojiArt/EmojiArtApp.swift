//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Jasmo Two on 26/05/23.
//

import SwiftUI

@main
struct EmojiArtApp: App {  
  var body: some Scene {
    WindowGroup {
      EmojiArtDocumentView(document: EmojiArtDocument())
    }
  }
}
