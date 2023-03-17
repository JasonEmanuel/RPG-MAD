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
var playerHP : Int = 100
var playerMP : Int = 50
var potion : Int = 10
var elixir : Int = 5
var enemyHP : Int = 1000
var enemyName : String = ""
var doubleDamage : Bool = false

var enemy : [String] = []
enemy.append("Troll")
enemy.append("Golem")

openingScreen()

// Function untuk opening screen
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

// Function untuk welcoming screen
func welcomeScreen(){
    while(nameInput.isEmpty || nameInput.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil){
        print("\nMay I know your name, a young wizard?")
        nameInput = readLine()!
    }
    print("\nNice to meet you \(nameInput)")
    journeyScreen()
}

// Function untuk journey screen
func journeyScreen(){
    while(choiceInput != "q"){
        choiceInput = ""
        print("\nFrom here, you can...")
        print("""
              \n[C]heck your health and stats
              [H]eal your wounds with potion
              [D}rink elixir to recover your energy
              
              ...or choose where you want to go
              
              [F]orest of Troll
              [M]ountain of Golem
              [Q]uit Game
              
              Your choice?
              """)
        choiceInput = readLine()!.lowercased()
        
        if choiceInput == "c"{
            playerStatScreen()
        }else if choiceInput == "d"{
            drinkElixir()
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

// Function untuk menunjukkan stat dari player
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

// Function untuk minum elixir pada journey screen
func drinkElixir(){
    print("\nYour MP is \(playerMP)")
    print("You have \(elixir) Elixirs.")
    
    print("\nAre you sure want to use 1 elixir to recover your MP? [Y/N]")
    let drinkChoice = readLine()!.lowercased()
    switch drinkChoice {
    case "y" :
        if elixir > 0 {
            if playerMP < 50 {
                playerMP += 10
                if playerMP > 50 {
                    playerMP = 50
                }
                print("\nYou used 1 elixir")
                elixir -= 1
                print("Your MP now is: \(playerMP)")
                print("You have \(elixir) left.")
            } else {
                print("Your MP is still full.")
                print("Press [return] to go back")
                let fullmp = readLine()!
                switch fullmp {
                case "":
                    journeyScreen()
                default:
                    drinkElixir()
                }
            }
        } else {
            print("You have no elixir left")
            print("Press [return] to go back")
            let noelixir = readLine()!
            switch noelixir {
            case "":
                journeyScreen()
            default:
                drinkElixir()
            }
        }
    case "n" :
        print("Good luck with your journey.")
        journeyScreen()
    default:
        print("Press Y or N")
    }
}

// Function untuk minum elixir pada battle screen
func drinkElixirBattle(){
    print("\nYour MP is \(playerMP)")
    print("You have \(elixir) Elixirs.")
    
    print("\nAre you sure want to use 1 elixir to recover your MP? [Y/N]")
    let drinkChoice = readLine()!.lowercased()
    switch drinkChoice {
    case "y" :
        if elixir > 0 {
            if playerMP < 50 {
                playerMP += 10
                if playerMP > 50 {
                    playerMP = 50
                }
                print("\nYou used 1 elixir")
                elixir -= 1
                print("Your MP now is: \(playerMP)")
                print("You have \(elixir) left.")
            } else {
                print("Your MP is still full.")
                print("Press [return] to go back")
                let fullmp = readLine()!
                switch fullmp {
                case "":
                    battleScreen()
                default:
                    drinkElixir()
                }
            }
        } else {
            print("You have no elixir left")
            print("Press [return] to go back")
            let noelixir = readLine()!
            switch noelixir {
            case "":
                battleScreen()
            default:
                drinkElixir()
            }
        }
    case "n" :
        print("Good luck with your journey.")
        battleScreen()
    default:
        print("Press Y or N")
    }
}

// Function untuk heal wound pada journey screen
func healWoundScreen(){
    print("\nYour HP is \(playerHP)")
    print("You have \(potion) Potions.")
    
    print("\nAre you sure want to use 1 potion to heal wound? [Y/N]")
    let healChoice = readLine()!.lowercased()
    switch healChoice {
    case "y" :
        if potion > 0 {
            if playerHP < 100 {
                playerHP += 20
                if playerHP > 100 {
                    playerHP = 100
                }
                print("\nYou used 1 potion")
                potion = potion - 1
                print("Your HP now is: \(playerHP)")
                print("You have \(potion) left.")
            } else {
                print("\nYour health is still full.")
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
        healWoundScreen()
    }
}

// Function untuk heal wound pada battle screen
func healBattle(){
    print("\nYour HP is \(playerHP)")
    print("You have \(potion) Potions.")
    
    print("\nAre you sure want to use 1 potion to heal wound? [Y/N]")
    let healChoice = readLine()!.lowercased()
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
        healBattle()
    }

}

// Function untuk menunjukkan battle screen
func battleScreen(){
    
    print("\n😈Name: \(enemyName)")
    print("😈Health: \(enemyHP)")
    print("""
    Choose your action:
    [1] Physical Attack. No mana required. Deal 5pt of damage.
    [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
    [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
    
    [4] Use Potion to heal wound. Player HP [\(playerHP)]
    [5] Use Elixir to add MP. Player MP [\(playerMP)]
    [6] Scan enemy's vital.
    [7] Flee from battle.
    
    Your choice?
    """)
    let battleInput = readLine()!
    switch battleInput {
    case "1":
        if doubleDamage == false {
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
        } else {
            enemyHP -= 10
            print("You attacked the \(enemyName), you dealt 10pt of damage")
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

        }
    case "2":
        if doubleDamage == false {
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
                        print("Oh, the \(enemyName) you just killed dropped something.")
                        print()
                        enemyHP = 1000
                        let randomItem = Int.random(in: 1...2)
                        if randomItem == 1 {
                            potion += 1
                            print("You found a potion underneath it's body.")
                        } else {
                            elixir += 1
                            print("You found an elixir underneath it's body.")
                        }
                    }
                }
            } else {
                print("Your MP is not enough")
                print()
                battleScreen()
            }
        } else {
            if playerMP > 15 {
                print("You attacked the \(enemyName) with meteor")
                playerMP -= 15
                enemyHP -= 100
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
                        print()
                        enemyHP = 1000
                    }
                }
            } else {
                print("Your MP is not enough")
                print()
                battleScreen()
            }
        }
    case "3":
        if playerMP >= 10 {
            playerMP -= 10
            print("You blocked the enemy's attack.")
            print()
            battleScreen()
        } else {
            print("You don't have enough MP")
            print()
            battleScreen()
        }
    case "4":
        healBattle()
    case "5":
        drinkElixirBattle()
    case "6":
        doubleDamage = true
        print("You found out the \(enemyName)'s weakness, you could easily attack them now.")
        battleScreen()
    case "7":
        fleeBattle()
    default:
        print("Invalid choice, pick again.")
        battleScreen()
    }
}

// Function untuk quit dari game/program
func quitGame(){
    print("Thank you for playing, see you next time!")
    exit(0)
}

// Function untuk flee dari battle
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
