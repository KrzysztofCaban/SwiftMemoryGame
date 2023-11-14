import SwiftUI

class MemoGameViewModel: ObservableObject {
    
    private static let emojis = [Color.orange : ["🥹", "🥸", "🥶", "😱", "🫠","🤠", "😍", "🫡", "🤧", "😇", "🤩", "🥳", "😡"],
                                 Color.blue : ["🐶", "🐱", "🐭", "🐹", "🐰","🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮"],
                                 Color.green : ["⚽️", "🏀", "🏈", "⚾️", "🥎","🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒"]
    ]
    @Published var themeColor = Color.orange
    static var theme = Color.orange

    private static func createMemoGame() -> MemoGameModel<String> {
            return MemoGameModel<String>(numberPairsOfCard: 8) { index in
                if emojis[theme]!.indices.contains(index) {
                    return emojis[theme]![index]
                } else {
                    return "??"
                }
            }
        }

        @Published private var model = createMemoGame()
    
        var cards: Array<MemoGameModel<String>.Card> {
            return model.cards
        }

        func shuffle() {
            model.shuffle()
        }

        func choose(_ card: MemoGameModel<String>.Card) {
            model.choose(card)
        }

        func changeApplicationTheme(color: Color) {
            themeColor = color
            MemoGameViewModel.theme = color
            
            
            model.changeCardSet(numberPairsOfCard: 8) {
                index in
                if MemoGameViewModel.emojis[MemoGameViewModel.theme]!.indices.contains(index) {
                    return MemoGameViewModel.emojis[MemoGameViewModel.theme]![index]
                    } else {
                        return "??"
                    }
            }
        }
    
 
}
