//
//  ContentView.swift
//  MemoryGame
//
//  Created by Krzysztof Caban on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            
            cards.animation(.default, value: viewModel.cards)
            ThemeButtons
            Button(action: {
                viewModel.shuffle()
            }){
                Text("Przetasuj karty")
                    .font(.headline)
                    .padding()
                    .background(viewModel.themeColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }}
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing:0)]){
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
    
    var ThemeButtons: some View{
        HStack{
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "face.smiling.inverse", content: "Emojis", ownColor: Color.orange).foregroundColor(viewModel.themeColor)
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "pawprint.fill", content: "Animals", ownColor: Color.blue).foregroundColor(viewModel.themeColor)
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "figure.racquetball", content: "Sports", ownColor: Color.green).foregroundColor(viewModel.themeColor)
            Spacer()
        }
    }
}


#Preview {
    ContentView( viewModel: MemoGameViewModel())
}
