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
var healChoice : String = ""
var playerHP : Int = 100
var playerMP : Int = 50
var potion : Int = 10
var elixir : Int = 5
var enemyHP : Int = 1000
var enemyName : String = ""

var skills : [String] = []
skills.append("Physical Attack")
skills.append("Meteor")
skills.append("Shield")

var enemy : [String] = []
enemy.append("Troll")
enemy.append("Golem")

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
            for enemyname in enemy{
                if enemyname == "Troll" {
                    print("As you enter the forest, you feel a sense of unease wash over you.")
                    print("Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.")
                    enemyName = enemyname
                    battleScreen()
                }
            }
        }else if choiceInput == "m"{
            for enemyname in enemy{
                if enemyname == "Golem" {
                    print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.")
                    print("Suddenly, you hear the sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.")
                    enemyName = enemyname
                    battleScreen()
                }
            }
        }else if choiceInput == "q"{
            quitGame()
        }
    }
}

func playerStatScreen(){
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
    switch returnCInput{
    case "" :
        journeyScreen()
    default:
        print("Just click enter")
        playerStatScreen()
    }
}

func healWoundScreen(){
    print("\nYour HP is \(playerHP)")
    print("You have \(potion) Potions.")
    
    print("\nAre you sure want to use 1 potion to heal wound? [Y/N]")
    healChoice = readLine()!.lowercased()
    switch healChoice {
    case "y" :
        if potion > 0 {
            if playerHP < 100 {
                playerHP = playerHP + 20
                if playerHP > 100 {
                    playerHP = 100
                }
                print("You used 1 potion")
                potion = potion - 1
                print("Yout HP now is: \(playerHP)")
                print("\nYou have \(potion) left.")
            } else {
                print("Your health is still full.")
                print("Press [return] to go back")
                let fullhpheal = readLine()!
                switch fullhpheal {
                case "" :
                    journeyScreen()
                default:
                    healWoundScreen()
                }
            }
        }else {
            print("You have no potion left.")
            print("Press [return] to go back.")
            let nopotionleft = readLine()!
            switch nopotionleft {
            case "" :
                journeyScreen()
            default:
                healWoundScreen()
            }
        }
    case "n" :
        print("Good luck with your journey.")
        journeyScreen()
    default:
        print("Press Y or N")
    }
}

func healBattle(){
    print("\nYour HP is \(playerHP)")
    print("You have \(potion) Potions.")
    
    print("\nAre you sure want to use 1 potion to heal wound? [Y/N]")
    healChoice = readLine()!.lowercased()
    switch healChoice {
    case "y" :
        if potion > 0 {
            if playerHP < 100 {
                playerHP = playerHP + 20
                if playerHP > 100 {
                    playerHP = 100
                }
                print("You used 1 potion")
                potion = potion - 1
                print("Yout HP now is: \(playerHP)")
                print("\nYou have \(potion) left.")
                battleScreen()
            } else {
                print("Your health is still full.")
                print("Press [return] to go back")
                let fullhpheal = readLine()!
                switch fullhpheal {
                case "" :
                    battleScreen()
                default:
                    healBattle()
                }
            }
        }else {
            print("You have no potion left.")
            print("Press [return] to go back.")
            let nopotionleft = readLine()!
            switch nopotionleft {
            case "" :
                battleScreen()
            default:
                healBattle()
            }
        }
    case "n" :
        print("Good luck with your journey.")
        battleScreen()
    default:
        print("Press Y or N")
    }

}

func battleScreen(){
    
    print("😈Name: \(enemyName)")
    print("😈Health: \(enemyHP)")
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
    let battleInput = readLine()!
    switch battleInput {
    case "1":
        enemyHP -= 5
        print("You attacked the \(enemyName), you dealt 5pt of damage")
        print()
        print("\(enemyName) attacked you, you lost 10 HP")
        playerHP -= 10
        if playerHP <= 0 {
            print("You ran out of HP, it's time to flee.")
            journeyScreen()
            playerHP = 10
            enemyHP = 1000
        } else {
            if enemyHP > 0 {
                if playerMP < 50 {
                    playerMP += 5
                    if playerMP > 50 {
                        playerMP = 50
                    }
                }
                battleScreen()
            } else if enemyHP <= 0 {
                print("You killed the monster. Great job!")
                enemyHP = 1000
            }
        }
    case "2":
        if playerMP > 15 {
            print("You attacked the \(enemyName) with meteor")
            playerMP -= 15
            enemyHP -= 50
            if playerHP <= 0 {
                print("You ran out of HP, it's time to flee.")
                journeyScreen()
                playerHP = 10
                enemyHP = 1000
            } else {
                if enemyHP > 0 {
                    if playerMP < 50 {
                        playerMP += 5
                        if playerMP > 50 {
                            playerMP = 50
                        }
                    }
                    battleScreen()
                } else if enemyHP <= 0 {
                    print("You killed the monster. Great job!")
                    enemyHP = 1000
                }
            }
        } else {
            print("Your MP is not wnough")
            battleScreen()
        }
    case "3":
        print("")
    case "4":
        healBattle()
    case "5":
        print("")
    case "6":
        fleeBattle()
    default:
        print("Invalid choice, pick again.")
        battleScreen()
    }
}

    
func quitGame(){
    print("Thank you for playing, see you next time!")
    exit(0)
}

func fleeBattle(){
    print("You feel that if you don't escape soon, you won't be able to continue the fight.")
    print("You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.")
    print("You're safe, for now.")
    print("Press [return] to continue.")
    let fleeInput = readLine()!
    switch fleeInput {
    case "" :
        enemyHP = 1000
        journeyScreen()
    default :
        print("Just click enter.")
        fleeBattle()
    }
}
