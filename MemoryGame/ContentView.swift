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
            Button(action: {
                viewModel.shuffle()                }) {
                    Text("Przetasuj karty")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            cards.animation(.default, value: viewModel.cards)
            ThemeButtons
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
            ThemeButton(viewModel: viewModel, imageName: "pencil", content: "Motyw 1", ownColor: Color.green)
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "pencil", content: "Motyw 2", ownColor: Color.blue)
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "pencil", content: "Motyw 1", ownColor: Color.red)
            Spacer()
        }
    }
}


#Preview {
    ContentView( viewModel: MemoGameViewModel())
}
