//
//  Inventory.swift
//  0706012110003-Jason Emanuel Susanto - AFL 1
//
//  Created by MacBook Pro on 31/03/23.
//

import Foundation

class Inventory {
    var potionName: String
    
    init(potionName: String) {
        self.potionName = potionName
    }
}

class Potion: Inventory {
    var potion: Int
    
    init(potionName: String, potion: Int) {
        self.potion = potion
        super.init(potionName: potionName)
    }

    func usePotion(player: Hero) {
        hero.potion -= 1
        hero.playerHP += 20
    }
}

class Elixir: Inventory {
    var elixir: Int
    
    init(potionName: String, elixir: Int) {
        self.elixir = elixir
        super.init(potionName: potionName)
    }
    
    func usePotion(player: Hero) {
        hero.elixir -= 1
        hero.playerMP += 10
    }
}

