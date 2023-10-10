//
//  ContentView.swift
//  MemoryGame
//
//  Created by Krzysztof Caban on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["🥹", "🥸", "🥶", "😱", "🫠", "🤠", "🎃", "🤡", "👻", "😇"]
    
    @State var cardCounter: Int = 2
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], content: {
                    ForEach(1 ... cardCounter, id: \.self){ item in
                        CardView(emoji: emojis[item]).frame(height: 120)
                    }
                }).foregroundColor(.blue)
            }
            
            
            HStack{
                adjustCardNumber(by: -2, symbol: "minus.square")
                    .disabled(cardCounter <= 2 ? true : false)
                
                Spacer()
                
                adjustCardNumber(by: 2, symbol: "plus.app")
                    .disabled(cardCounter + 2 >= emojis.count ? true : false)
            }
            
        }
        .padding()
    }
    
    
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        return Button(action: {cardCounter = cardCounter + offset}, label: {
            Image(systemName: symbol).resizable()
                .frame(width: 30, height: 30)
        })
    }
}


#Preview {
    ContentView()
}
