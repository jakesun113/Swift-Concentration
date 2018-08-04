//
//  ViewController.swift
//  Concentration
//
//  Created by Jiacheng Sun on 25/7/18.
//  Copyright © 2018 Jiacheng Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //use model in controller
    //lazy: not initialize until try to use it
    //not work in Swift3, work in Swift4
    //set to private cause numberofPairsOfcards is relevant to UI, don't want it to be public
    private lazy var game = Concentration(numberofPairsOfCards: numberofPairsOfCards)
    
    //computed property
    var numberofPairsOfCards: Int
    {
        //if only get method (read-only property), can be omitted
        get
        {
            return (touchButton.count + 1 ) / 2
        }
    }
    
    //don't want other object to set the value of flipCount
    private(set) var flipCount :Int = 0
    {
        // property observer
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    //array attributes
    //Type: optional, two states: set (array) or unset -> "nil"
    @IBOutlet private var touchButton: [UIButton]!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        
        //print("a ghost!!")
        flipCount += 1
        //flipCard(withEmoji: "👻", on: sender)
        //use "!" to unwrap optional type, 
        //assume optional type is associated, get the value of it
        //let cardNumber = touchButton.index(of: sender)!
        if let cardNumber = touchButton.index(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        
        //flipCard(withEmoji: emojiText[cardNumber], on: sender)
        //print("card number: \(cardNumber)")
    }
    
    private func updateViewFromModel()
    {
        //another way
        for index in touchButton.indices
            //for index in 0..<touchButton.count
        {
            let button = touchButton[index]
            let card = game.cards[index]
            if card.isFaceUp
            {
                button.setTitle(emoji(for : card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            }
            else
            {
                button.setTitle("", for: UIControlState.normal)
                //if matched, opcity:0, clear
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.8762708306, green: 0.9558493495, blue: 0.968680203, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }
    
    private var emojiText : Array<String> = ["👻","🎃","🤡","🦇","👿","🤖","🙈","☂️"]
    
    //dictionary type
    //var emoji = Dictionary<Int,String>()
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String
    {
        
        if emoji[card.identifier] == nil
        {
            if emojiText.count > 0
            {
                //type transfer
                let randomIdex = Int(arc4random_uniform(UInt32(emojiText.count)))
                //return the item you removed, after return, remove it from the list
                emoji[card.identifier] = emojiText.remove(at: randomIdex)
            }
            
        }
        //every time look up in a dictionary, return type "optional"
        if emoji[card.identifier] != nil
        {
            return emoji[card.identifier]!
        }
        else
        {
            return "?"
        }
        //return its value, if nil, return "?"
        // return emoji[card.identifier] ??  "?"
    }
    
    
    //    func flipCard(withEmoji emoji :String, on button:UIButton){
    //        //debug method
    //        //print("flipcard with emoji: \(emoji)")
    //        if button.currentTitle == emoji{
    //            button.setTitle("", for:[])
    //            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
    //        }
    //        else{
    //            button.setTitle(emoji, for:[])
    //            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    //        }
    //    }
    
}

