//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by Krzysztof Caban on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable{

    private (set) var cards : Array<Card>

    init(numberPairsOfCard: Int, cardContentFactory:(Int)->CardContent) {
        cards = []
        // dodaj karty parami numberPairsOfCard * 2
        for pairIndex in 0..<max(2, numberPairsOfCard) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card (content: content, id: "\(pairIndex+1)a"))
            cards.append(Card (content: content, id: "\(pairIndex+1)b"))
        }
    }

    // NOWA WERSJA
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            //nie wiem gdzie się podział return
            cards.indices.filter{index in cards[index].isFaceUp}.only
        }
        set {
            cards.indices.forEach{cards[$0].isFaceUp = (newValue == $0)}
        }
    }

    // NOWA WERSJA
    mutating func choose (_ card: Card) {
        if let chosenIndex = cards.firstIndex (where: {$0.id == card.id}) {
            if !cards [chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content==cards [potentialMatchedIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchedIndex].isMatched = true
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }

    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }

    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "mached" : "")"
        }
    }



}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
