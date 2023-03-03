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
var returnCInput : String = "s"
var choiceFInput : String = ""
var playerHP : Int = 100
var playerMP : Int = 50
var potion : Int = 10
var elixir : Int = 5
var enemyHP : Int = 1000

openingScreen()

func openingScreen(){
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
    welcomeScreen()
}

func welcomeScreen(){
    while(nameInput.isEmpty || nameInput.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil){
        print("\nMay I know your name, a young wizard?")
        nameInput = readLine()!
    }
    print("\nNice to meet you \(nameInput)")
    journeyScreen()
}

func journeyScreen(){
    while(choiceInput != "q"){
        choiceInput = ""
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
            playerStatScreen()
        }else if choiceInput == "h"{
            healWoundScreen()
        }else if choiceInput == "f"{
            forestOfTroll()
        }else if choiceInput == "m"{
            mountainOfGolem()
        }else if choiceInput == "q"{
            quitGame()
        }
    }
}

func playerStatScreen(){
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
        returnCInput = readLine()!
    }
}

func healWoundScreen(){
    print("\nYour HP is \(playerHP)")
    print("You have \(potion) Potions.")
    
    print("\nAre you sure want to use 1 potion to heal wound? [Y/N]")
}

func forestOfTroll(){
    print("As you enter the forest, you feel a sense of unease wash over you.")
    print("Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging    from the shadows.")
    
    print("""
    \n😈Name: Troll x1
    😈Health: \(enemyHP)
    """)
    
    print("""
    Choose your action:
    [1] Physical Attack. No mana required. Deal 5pt of damage.
    [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
    [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
    
    [4] Use Potion to heal wound.
    [5] Scan enemy's vital.
    [6] Flee from battle.
    
    Your choice?
    """)
    choiceFInput = readLine()!
    let numberF = Int(choiceFInput)
    if numberF == 1 {
        print("Physical attack")
    }else if numberF == 2{
        print("meteor")
    }
}

func mountainOfGolem(){
    print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.")
    print("Suddenly, you hear the sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.")
    
    print("""
    \n😈Name: Golem x1
    😈Health: \(enemyHP)
    """)
    
    print("""
    Choose your action:
    [1] Physical Attack. No mana required. Deal 5pt of damage.
    [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
    [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
    
    [4] Use Potion to heal wound.
    [5] Scan enemy's vital.
    [6] Flee from battle.
    
    Your choice?
    """)
    choiceFInput = readLine()!
    let numberF = Int(choiceFInput)
    if numberF == 1 {
        print("Physical attack")
    }else if numberF == 2{
        print("meteor")
    }
}
    
func quitGame(){
    print("Thank you for playing, see you next time!")
    exit(0)
}
