//
//  Enemy.swift
//  0706012110003-Jason Emanuel Susanto - AFL 1
//
//  Created by MacBook Pro on 31/03/23.
//

import Foundation

protocol Enemy {
    func enemyAttack(player: Hero)
    func meetBoss(chance: Int)
    func enemyWin(player: Hero)
}

class Monster: Enemy{
    var enemyAttack: Int
    var enemyHP: Int
    var enemyName: String
    var enemyDrop: Int
    var enemyType: String
    
    init(enemyAttack: Int, enemyHP: Int, enemyName: String, enemyDrop: Int, enemyType: String) {
        self.enemyAttack = enemyAttack
        self.enemyHP = enemyHP
        self.enemyName = enemyName
        self.enemyDrop = enemyDrop
        self.enemyType = enemyType
    }
    
    func enemyAttack(player: Hero) {
        print("\(enemyName) attacked you, you lost 10 HP")
        hero.playerHP -= enemyAttack
    }
    
    
    func meetBoss(chance: Int) {
        if chance > 80 {
            enemyAttack = 20
            enemyHP = 1000
            enemyType = "Buffed"
        } else {
            enemyAttack = 10
            enemyHP = 300
            enemyType = "Normal"
        }
    }
    
    func enemyWin(player: Hero) {
        print("\(enemyName) [\(enemyType)] has just defeated you.")
        print("Returning to your previous path.")
        hero.playerHP = 10
        hero.multiplier = 1
    }
}
