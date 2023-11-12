//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by Krzysztof Caban on 17/10/2023.
//

import SwiftUI

struct ThemeButton: View {
        var viewModel: MemoGameViewModel
        var imageName: String
        var content: String
        var ownColor = Color.blue

        var body: some View {
            Button(action: {
                viewModel.changeApplicationTheme(color: ownColor)
            }, label: {
                VStack {
                    Image(systemName: imageName).font(.title)
                    Text(content)
                }
            })
        }
}

