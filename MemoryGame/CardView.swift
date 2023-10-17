//
//  CardView.swift
//  MemoryGame
//
//  Created by Krzysztof Caban on 10/10/2023.
//

import SwiftUI
struct CardView: View {
    
    @State var isFlipped: Bool = false
    let emoji: String
    var body: some View {
        Group{
            ZStack{
                if(isFlipped){
                    RoundedRectangle(cornerRadius: 12).fill(.white)
                    RoundedRectangle(cornerRadius: 12).strokeBorder(.blue, lineWidth: 5)
                }else {
                    RoundedRectangle(cornerRadius: 12)
                        
                }
                
                Text(emoji).font(.largeTitle).opacity(isFlipped ? 1 : 0)
            }
        }
        .onTapGesture {
            isFlipped.toggle()
        }.aspectRatio(2/3, contentMode: .fill)
        
        
    }
}

#Preview {
    CardView(emoji: "😇")
}
