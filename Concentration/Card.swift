//
//  Card.swift
//  Concentration
//
//  Created by Jiacheng Sun on 27/7/18.
//  Copyright © 2018 Jiacheng Sun. All rights reserved.
//

import Foundation

//model of Card

//struct and class
//struct has no inheritance
//struct is value type, class is reference type
//when passing struct type, you copy them
//you can pass struct type like a value around the program
struct Card: Hashable
{
    //implement hashable and equable protocol
    var hashValue: Int { return identifier}
    
    static func ==(ihs: Card, rhs:Card) -> Bool
    {
        return ihs.identifier == rhs.identifier
    }
    
    
    var isFaceUp = false
    var isMatched = false
    // change type to "private"
    private var identifier: Int
    
    //init tend to have to same internal and external name
    //init(identifier: Int)
    //{
      //  self.identifier = identifier
   // }
    
    
    //create unique id
    
    private static var idFactory = 0
    
    //return type "->" int
    //static method, like global method, send type of Card
    private static func getUniqueId() -> Int
    {
        idFactory += 1
        return idFactory
    }
    
    init()
    {
        self.identifier = Card.getUniqueId()
    }
}
