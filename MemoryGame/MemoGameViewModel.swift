import SwiftUI

class MemoGameViewModel: ObservableObject {
    
    private static let emojis = ["🥹", "🥸", "🥶", "😱", "🫠","🤠", "😍", "🫡", "🤧", "😇", "🤩", "🥳", "😡"]
       @Published var themeColor = Color.orange

    private static func createMemoGame() -> MemoGameModel<String> {
            return MemoGameModel<String>(numberPairsOfCard: 8) { index in
                if emojis.indices.contains(index) {
                    return emojis[index]
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
        }
    
 
}
