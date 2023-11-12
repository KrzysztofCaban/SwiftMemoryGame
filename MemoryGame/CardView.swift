//
//  CardView.swift
//  MemoryGame
//
//  Created by Krzysztof Caban on 10/10/2023.
//

import SwiftUI
struct CardView: View {
    
    var card: MemoGameModel<String>.Card
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill()
                base.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }.opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }.aspectRatio(2/3,contentMode: .fill).opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        
    }
}


