//
//  Concentration.swift
//  Concentration
//
//  Created by Jiacheng Sun on 27/7/18.
//  Copyright © 2018 Jiacheng Sun. All rights reserved.
//

import Foundation

//design public API, build Model
class Concentration
{
    //instance of a struct
    var cards = Array<Card>()
    //var cards = [Card]()
    
    //optioanl type
    var indexOfoneCardFacedUp :Int?
    
    //index based to search array
    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfoneCardFacedUp, matchIndex != index
            {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfoneCardFacedUp = nil
            }
            else
            {
                //either no cards or 2 cards are faced up
                for flipDownIndex in cards.indices
                {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfoneCardFacedUp = index
            }
        }
        
    }
    
    init(numberofPairsOfCards: Int)
    {
        //after in, can be any sequence (array, string, counterable range)
        //range: from 1 to numberofPairsOfCards
        for _ in 1...numberofPairsOfCards
        {
            //struct must be initialized
            let card = Card()
            //a copy of the struct
            //let matchingcard = card
            
            //cards.append(card)
            //cards.append(matchingcard)
            //cards.append(card)
            
            //third way
            cards += [card, card]
        }
        
        //shuffle the cards
        var length = numberofPairsOfCards*2 - 1
        
        while( length > 0)
        {
            let rand = Int(arc4random_uniform(UInt32(length)))
            
            //print("swap card[\(length)] = \(cards[length].identifier) with card[\(rand)] = \(cards[rand].identifier)")
            
            cards.swapAt(length, rand)
            
            //print("previous id:\(cards[length].identifier), afterwards id:\(cards[rand].identifier)")
            
            length -= 1
        }
        
        //        for id in 1...numberofPairsOfCards*2 - 1
        //        {
        //            print("afterwards id:\(cards[id].identifier)")
        //
        //        }
    }
}
