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
struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    //init tend to have to same internal and external name
    //init(identifier: Int)
    //{
      //  self.identifier = identifier
   // }
    
    
    //create unique id
    
    static var idFactory = 0
    
    //return type "->" int
    //static method, like global method, send type of Card
    static func getUniqueId() -> Int
    {
        idFactory += 1
        return idFactory
    }
    
    init()
    {
        self.identifier = Card.getUniqueId()
    }
}
