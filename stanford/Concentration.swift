//
//  Concentration.swift
//  stanford
//
//  Created by cybuhh on 10/12/2017.
//  Copyright © 2017 cybuhh. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func choosedCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            /* cards.append(card)
            cards.append(card) */
        }
        
        // TODO: shuffle the cards
    }
}
