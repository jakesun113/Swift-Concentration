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
    lazy var game = Concentration(numberofPairsOfCards: (touchButton.count + 1 ) / 2)
    
    var flipCount :Int = 0
    {
        // property observer
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    //array attributes
    //Type: optional, two states: set (array) or unset -> "nil"
    @IBOutlet var touchButton: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        
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
    
    func updateViewFromModel()
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
    
    var emojiText : Array<String> = ["👻","🎃","🤡","🦇","👿","🤖","🙈","☂️"]
    
    //dictionary type
    //var emoji = Dictionary<Int,String>()
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String
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

