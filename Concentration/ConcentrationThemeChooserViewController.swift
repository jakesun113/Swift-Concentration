//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by wry on 2018/9/28.
//  Copyright © 2018年 Jiacheng Sun. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    

    let themes = [
        "Sports": "⚽︎⚾🏀🏈🎾🏐🏉🎱🏓🏸🏏⛳️",
        "Animals": "🐶🐱🐰🦊🐻🐮🦁🐯🐷🐒🦉🦀",
        "Faces": "🤔🤫🙄🤕🤤🤠🤗😷🤧😋🤫😤"
    ]
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Choose Theme" {
           
            //segue always create a new MVC
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController{
                    cvc.theme = theme
                }
            
            }
            
        }
    }
  

}
