//
//  Hero.swift
//  0706012110003-Jason Emanuel Susanto - AFL 1
//
//  Created by MacBook Pro on 31/03/23.
//

import Foundation

struct Hero {
    var playerName: String
    var playerHP: Int
    var multiplier: Int
    
    init(playerName: String, playerHP: Int, multiplier: Int) {
        self.playerName = playerName
        self.playerHP = playerHP
        self.multiplier = multiplier
    }
    
    mutating func getPlayerStats(playerName: String, playerHP: Int, playerMP: Int){
        print("\nPlayer name : \(playerName)")
        
        print("\n\(playerHP)/100")
        print("\(playerMP)/50")
        
        print("""
        \nMagic:
        - Physical Attack. No mana required. Deal 5pt of damage.
        - Meteor. Use 15pt of MP. Deal 50pt of damage.
        - Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
        """)
        
        print("""
        \nItems:
        - Potion 10. Heal 20pt of your HP.
        - Elixir 5. Add 10pt of your MP.
        """)
        
        /*print("""
        \nItems:
        - Potion x\(potion). Heal 20pt of your HP.
        - Elixir x\(elixir). Add 10pt of your MP.
        """)*/
    }
    
    mutating func fleeBattle() {
        
    }
    
    mutating func scanEnemy() {
        multiplier = 2
    }
    
    mutating func playerWin() {
        
    }
    
}
