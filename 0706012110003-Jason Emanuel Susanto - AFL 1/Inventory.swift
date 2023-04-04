//
//  Inventory.swift
//  0706012110003-Jason Emanuel Susanto - AFL 1
//
//  Created by MacBook Pro on 31/03/23.
//

import Foundation

class Inventory {
    var potionName: String
    var amount: Int
    
    
    init(potionName: String, amount: Int) {
        self.potionName = potionName
        self.amount = amount
    }
    
    func usePotion() {
        amount -= 1
    }
}
