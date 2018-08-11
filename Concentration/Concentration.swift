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
    //can access, but cannot change the value of cards
    private(set) var cards = Array<Card>()
    //var cards = [Card]()
    
    //change to computed property
    private var indexOfoneCardFacedUp :Int?
    {
        get
        {
            var foundIndex: Int?
            for index in cards.indices
            {
                if cards[index].isFaceUp
                {
                    if foundIndex == nil
                    {
                        foundIndex = index
                    }
                    else
                    {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        
        set(newValue)
        {
            for index in cards.indices
            {
                //when index == newValue, set faceUp as true
                //in other cases, set as false
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    
    //index based to search array
    //make it public so that other object can use it
    func chooseCard(at index: Int)
    {
        //add assertion, if not true, program will crash
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfoneCardFacedUp, matchIndex != index
            {
                //check if cards match
                if cards[matchIndex] == cards[index]
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
            }
            else
            {
                indexOfoneCardFacedUp = index
            }
        }
        
    }
    
    init(numberofPairsOfCards: Int)
    {
        assert(numberofPairsOfCards > 0, "Concentration.init(at: \(numberofPairsOfCards)): you must have at least one pair of cards")
        
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
