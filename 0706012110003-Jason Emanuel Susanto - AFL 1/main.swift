//
//  main.swift
//  0706012110003-Jason Emanuel Susanto - AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var openingInput: String = "h"
var nameInput : String = ""
var choiceInput : String = ""
var playerHP : Int = 100
var playerMP : Int = 50
var potion : Int = 10
var elixir : Int = 5
var returnCInput : String = "s"

while(openingInput.isEmpty == false){
    print("Welcome to the world of magic! 🧙‍♂️🧌")
    print("""
        \nYou have been chosen to embark on anepic journey as a young wizard on the path to becoming a master of the
        arcane arts. Your adventures will take you through forests 🌲, mountains , and dungeons , where you will
        face challenges, make allies, and fight enemies
    """)

    print("\nPress [return] to continue")
    openingInput = readLine()!
    if(openingInput.isEmpty == false){
        print("Just click enter")
    }
}


while(nameInput.isEmpty || nameInput.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil){
    print("\nMay I know your name, a young wizard?")
    nameInput = readLine()!
}
print("\nNice to meet you \(nameInput)")

while(choiceInput != "q"){
    print("\nFrom here, you can...")
    print("""
          \n[C]heck your health and stats
          [H]eal your wounds with potion
          
          ...or choose where you want to go
          
          [F]orest of Troll
          [M]ountain of Golem
          [Q]uit Game
          
          Your choice?
          """)
    choiceInput = readLine()!.lowercased()
    
    if choiceInput == "c"{
        while(returnCInput.isEmpty == false){
            print("\nPlayer name : \(nameInput)")
            
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
            - Potion x\(potion). Heal 20pt of your HP.
            - Elixir x\(elixir). Add 10pt of your MP.
            """)
            
            print("\nPress return to go back: ")
            returnCInput = readLine()
            if returnCInput.isEmpty {
                break
            }
        }
        
    }else if choiceInput == "h"{
        
    }else if choiceInput == "f"{
        
    }else if choiceInput == "m"{
        
    }else if choiceInput == "q"{
        print("Thank you for playing, see you again next time!")
        exit(0)
    }
}

    
