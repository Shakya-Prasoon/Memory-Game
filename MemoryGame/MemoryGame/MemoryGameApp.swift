//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Prasoon Shakya on 11/28/20.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
