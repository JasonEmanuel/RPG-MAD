//
//  Skill.swift
//  0706012110003-Jason Emanuel Susanto - AFL 1
//
//  Created by MacBook Pro on 31/03/23.
//

import Foundation

class Skill {
    var skillName: String
    var usedMP: Int
    
    init(skillName: String, usedMP: Int) {
        self.skillName = skillName
        self.usedMP = usedMP
    }
    
    func useSkill(player: Hero, monster: Monster) {
        hero.playerMP -= usedMP
    }
}

class Attack: Skill {
    var damage: Int
    
    init(skillName: String, usedMP: Int, damage: Int) {
        self.damage = damage
        super.init(skillName: skillName, usedMP: usedMP)
    }
    
    override func useSkill(player: Hero, monster: Monster) {
        super.useSkill(player: player, monster: monster)
        enemy.enemyHP -= damage * hero.multiplier
    }
}

class Shield: Skill {
    var turn: Int
    
    init(skillName: String, usedMP: Int, turn: Int) {
        self.turn = turn
        super.init(skillName: skillName, usedMP: usedMP)
    }
    
    override func useSkill(player: Hero, monster: Monster) {
        super.useSkill(player: player, monster: monster)
        turn = 1
        print("Your using your shield now.")
    }
    
    func isUp(){
        print("You blocked your enemy's attack.")
        turn -= 1
        battleScreen()
    }
}
