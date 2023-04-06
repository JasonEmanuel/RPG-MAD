//
//  main.swift
//  0706012110003-Jason Emanuel Susanto - AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

// Variabel untuk user input
var openingInput: String = "h"
var nameInput : String = ""
var choiceInput : String = ""
var returnCInput : String = "s"

// Variabel Inisialisasi
var meteor = Attack(skillName: "Meteor", usedMP: 10, damage: 100)
var phys = Attack(skillName: "Physical Attack", usedMP: 0, damage: 30)
var shield = Shield(skillName: "Shield", usedMP: 10, turn: 0)
var skills : [String] = []
var enemy = Monster(enemyAttack: 0, enemyHP: 0, enemyName: "", enemyDrop: 0, enemyType: "")
var hero = Hero(playerName: "", playerHP: 100, playerMP: 50, multiplier: 1, potion: 10, elixir: 5)
var potion = Potion(potionName: "Health Potion", potion: hero.potion)
var elixir = Elixir(potionName: "Mana Elixir", elixir: hero.elixir)


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
    hero.playerName = nameInput
    print("\nNice to meet you, \(hero.playerName)")
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
            enemy.enemyName = "Trolls of the Forest"
            print("As you enter the forest, you feel a sense of unease wash over you.")
            print("Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.")
            let randomChance = Int.random(in: 1...100)
            enemy.meetBoss(chance: randomChance)
            print("")
            battleScreen()
        }else if choiceInput == "m"{
            enemy.enemyName = "Mountain Golem"
            print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.")
            print("Suddenly, you hear the sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.")
            let randomChance = Int.random(in: 1...100)
            enemy.meetBoss(chance: randomChance)
            print("")
            battleScreen()
        }else if choiceInput == "q"{
            quitGame()
        }
    }
}

// Function untuk menunjukkan stat dari player
func playerStatScreen(){
    hero.getPlayerStats(playerName: hero.playerName, playerHP: hero.playerHP, playerMP: hero.playerMP)
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
    print("\nYour MP is \(hero.playerMP)")
    print("You have \(hero.elixir) Elixirs.")
    
    print("\nAre you sure want to use 1 elixir to recover your MP? [Y/N]")
    let drinkChoice = readLine()!.lowercased()
    switch drinkChoice {
    case "y" :
        if hero.elixir > 0 {
            if hero.playerMP < 50 {
                elixir.usePotion(player: hero)
                if hero.playerMP > 50 {
                    hero.playerMP = 50
                }
                print("\nYou used 1 elixir")
                print("Your MP now is: \(hero.playerMP)")
                print("You have \(hero.elixir) left.")
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
    print("\nYour MP is \(hero.playerMP)")
    print("You have \(hero.elixir) Elixirs.")
    
    print("\nAre you sure want to use 1 elixir to recover your MP? [Y/N]")
    let drinkChoice = readLine()!.lowercased()
    switch drinkChoice {
    case "y" :
        if hero.elixir > 0 {
            if hero.playerMP < 50 {
                elixir.usePotion(player: hero)
                if hero.playerMP > 50 {
                    hero.playerMP = 50
                }
                print("\nYou used 1 elixir")
                hero.elixir -= 1
                print("Your MP now is: \(hero.playerMP)")
                print("You have \(hero.elixir) left.")
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
    print("\nYour HP is \(hero.playerHP)")
    print("You have \(hero.potion) Potions.")
    
    print("\nAre you sure want to use 1 potion to heal wound? [Y/N]")
    let healChoice = readLine()!.lowercased()
    switch healChoice {
    case "y" :
        if hero.potion > 0 {
            if hero.playerHP < 100 {
                potion.usePotion(player: hero)
                //hero.playerHP += 20
                if hero.playerHP > 100 {
                    hero.playerHP = 100
                }
                print("\nYou used 1 potion")
                hero.potion -= 1
                print("Your HP now is: \(hero.playerHP)")
                print("You have \(hero.potion) left.")
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
    print("\nYour HP is \(hero.playerHP)")
    print("You have \(hero.potion) Potions.")
    
    print("\nAre you sure want to use 1 potion to heal wound? [Y/N]")
    let healChoice = readLine()!.lowercased()
    switch healChoice {
    case "y" :
        if hero.potion > 0 {
            if hero.playerHP < 100 {
                potion.usePotion(player: hero)
                if hero.playerHP > 100 {
                    hero.playerHP = 100
                }
                print("You used 1 potion")
                hero.potion -= 1
                print("Yout HP now is: \(hero.playerHP)")
                print("\nYou have \(hero.potion) left.")
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
    
    print("\n😈Name: \(enemy.enemyName)[\(enemy.enemyType)]")
    print("😈Health: \(enemy.enemyHP)")
    print("""
    Choose your action:
    [1] Physical Attack. No mana required. Deal 5pt of damage.
    [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
    [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
    
    [4] Use Potion to heal wound. Player HP [\(hero.playerHP)]
    [5] Use Elixir to add MP. Player MP [\(hero.playerMP)]
    [6] Scan enemy's vital.
    [7] Flee from battle.
    
    Your choice?
    """)
    let battleInput = readLine()!
    switch battleInput {
    case "1":
        phys.useSkill(player: hero, monster: enemy)
        if shield.turn == 1 {
            shield.isUp()
        }
        print("You attacked the \(enemy.enemyName), you dealt \(phys.damage)pt of damage")
        if enemy.enemyHP <= 0 {
            hero.heroWin(monster: enemy)
            enemyDrop()
            journeyScreen()
        }
        enemyAttack()
    case "2":
        if hero.playerMP < 10 {
            print("Your MP is not enough.")
            battleScreen()
        } else {
            meteor.useSkill(player: hero, monster: enemy)
            if shield.turn == 1 {
                shield.isUp()
            }
            print("You attacked the \(enemy.enemyName), you dealt \(meteor.damage)pt of damage")
            if enemy.enemyHP <= 0 {
                hero.heroWin(monster: enemy)
                enemyDrop()
                journeyScreen()
            }
            enemyAttack()
        }
    case "3":
        if shield.turn == 1 {
            print()
            print("You activated shield already.")
        } else {
            if hero.playerMP < 10 {
                print("You MP is not enough.")
                battleScreen()
            } else {
                shield.useSkill(player: hero, monster: enemy)
                battleScreen()
            }
        }
    case "4":
        healBattle()
    case "5":
        drinkElixirBattle()
    case "6":
        hero.scanEnemy()
        print("")
        battleScreen()
    case "7":
        hero.fleeBattle()
        let fleeInput = readLine()!
        switch fleeInput {
        case "" :
            journeyScreen()
        default :
            print("Just click enter.")
            hero.fleeBattle()
        }
    default:
        print("Invalid choice, pick again.")
        battleScreen()
    }
}

func enemyAttack(){
    enemy.enemyAttack(player: hero)
    if hero.playerHP <= 0 {
        enemy.enemyWin(player: hero)
        journeyScreen()
    } else {
        battleScreen()
    }
}

func enemyDrop(){
    if enemy.enemyType == "Buffed" {
        enemy.enemyDrop = Int.random(in: 3...5)
    } else {
        enemy.enemyDrop = Int.random(in: 1...2)
    }
    let randomDrop = Int.random(in: 1...2)
    if randomDrop == 1 {
        print("Enemy dropped \(enemy.enemyDrop)x potion.")
        hero.potion += enemy.enemyDrop
    } else {
        print("Enemy dropped \(enemy.enemyDrop)x elixir.")
        hero.elixir += enemy.enemyDrop
    }
}

// Function untuk quit dari game/program
func quitGame(){
    print("Thank you for playing, see you next time!")
    exit(0)
}


