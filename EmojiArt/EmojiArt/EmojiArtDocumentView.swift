//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Jasmo Two on 26/05/23.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
  
    var body: some View {
      ScrollView(Axis.Set.horizontal) {
        HStack {
          ForEach(EmojiArtDocument.palette.map { String($0) }, id: \.self) {emoji in
            Text(emoji)
              .font(Font.system(size: defaultEmojiSize))
          }
        }
      }
      .padding(.horizontal)
      Rectangle().foregroundColor(.yellow)
        .edgesIgnoringSafeArea([Edge.Set.horizontal, .bottom])
        .onDrop(of: ["public.image"], isTargeted: nil) {
          providers, location in
          return drop(providers: providers)
        }
    }
  
  private func drop(providers: [NSItemProvider]) -> Bool {
    let found = providers.loadFirstObject(ofType: URL.self) { url in
        print("dropped \(url)")
      
      document.setBackgroundUrl(url: url)
    }
    
    return found
  }
  
  private let defaultEmojiSize: CGFloat = 40.0
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//      EmojiArtDocumentView(document: EmojiArtDocument)
//    }
//}
