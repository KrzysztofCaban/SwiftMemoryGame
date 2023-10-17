//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by Krzysztof Caban on 17/10/2023.
//

import SwiftUI

struct ThemeButton: View {
    var text: String
    var icon: String
    @Binding var themeColor: Color
    var themeInput: Color
    var cardCountInput: Int
    @Binding var emojis: [String]
    @Binding var cardCount: Int
    @Binding var emojiSelected: Int
    var emojiInput: Int
    
    
    var body: some View {
        Button(action: {
            themeColor = themeInput
            cardCount = cardCountInput
            emojis.shuffle()
            emojiSelected = emojiInput
        }, label: {
            VStack{
                Image(systemName: icon).resizable()
                    .frame(width: 30, height: 30)
                Text(text)
            }
            
        })
    }
}

