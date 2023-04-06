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
    var playerMP: Int
    var multiplier: Int
    var potion : Int
    var elixir : Int
    
    init(playerName: String, playerHP: Int, playerMP: Int, multiplier: Int, potion: Int, elixir: Int) {
        self.playerName = playerName
        self.playerHP = playerHP
        self.playerMP = playerMP
        self.multiplier = multiplier
        self.potion = potion
        self.elixir = elixir
    }
    
    mutating func getPlayerStats(playerName: String, playerHP: Int, playerMP: Int){
        print("\nPlayer name : \(playerName)")
        
        print("\n\(playerHP)/100")
        print("\(playerMP)/50")
        
        print("""
        \nMagic:
        - Physical Attack. No mana required. Deal 30pt of damage.
        - Meteor. Use 10pt of MP. Deal 100pt of damage.
        - Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
        """)
        
        print("""
        \nItems:
        - Potion x\(potion). Heal 20pt of your HP.
        - Elixir x\(elixir). Add 10pt of your MP.
        """)
    }
    
    mutating func fleeBattle() {
        print("You feel that if you don't escape soon, you won't be able to continue the fight.")
        print("You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.")
        print("You're safe, for now.")
        print("Press [return] to continue.")
    }
    
    mutating func scanEnemy() {
        multiplier = 2
    }
    
    mutating func heroWin(monster: Monster) {
        print("You killed the \(enemy.enemyName)[\(enemy.enemyType)], great job!")
    }
    
}
