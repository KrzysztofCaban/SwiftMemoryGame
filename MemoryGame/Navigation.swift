//
//  Navigation.swift
//  MemoryGame
//
//  Created by Krzysztof Caban on 10/10/2023.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        HStack{
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "plus.app").resizable()
                    .frame(width: 30, height: 30)
            })
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "plus.app").resizable()
                    .frame(width: 30, height: 30)
            })
            
            Spacer()
        }
    }
    
}

#Preview {
    Navigation()
}
