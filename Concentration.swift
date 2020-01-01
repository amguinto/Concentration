//
//  Concentration.swift
//  Concentration
//
//  Created by Andy Guinto on 12/29/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    let emojis = ["☠️", "👽", "🤖", "👾"]

    func chooseCard(at index: Int)
    {
        if cards[index].isFaceUp
        {
            cards[index].isFaceUp = false
        }
        else
        {
            cards[index].isFaceUp = true
        }
    }
  
    // TODO: Fix so that the logic of setting up the concentration game is here.
//    init(numberOfPairsOfCards: Int)
//    {
//        for _ in 1...numberOfPairsOfCards
//        {
//            let card = Card()
//
//            // Add the pair of cards to the array.
//            // Best practice to modify array only once for efficiency.
//            cards += [card, card]
//        }
        
        // TODO: Shuffle Cards.
        
//    }
}
