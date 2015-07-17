//
//  Character.swift
//  RollingThunder
//
//  Created by Anthony Dario on 7/9/15.
//  Copyright (c) 2015 Anthony Dario. All rights reserved.
//

import UIKit

class Character: NSObject {
   
    // character types
    enum CharacterType: Int{
        case Earth = 1
        case Wind  = 2
        case Fire  = 3
        case Water = 4
        case Holy  = 5
        case Demon = 6
    }
    
    // character styles
    enum CharacterStyle: Int {
        case Ranged = 1
        case Melee = 2
    }
    
    var name: String!
    
    // stats
    var health          : Int
    var curHealth       : Int
    var attackSlots     : Int
    var defenseSlots    : Int
    var recoverySlots   : Int
    
    // die
    var totalDie                : Int
    var specialDice             : [Int]!
    var die                     : [[Int]]!
    var curAttackSlotContent    : [[Int]]!
    var curDefenseSlotContent   : [[Int]]!
    var curRecoverySlotContent  : [[Int]]!
    
    var mobility: Int!
    var type: CharacterType!
    var style: CharacterStyle!
    
    // dice
    
    
    // skill
    //var leaderSkill: leaderSkill
    //var activeSkill: activeSkill
    //var traits: Trait
    
    
    init(name: String, health: Int, attackSlots: Int, defenseSlots: Int, recoverySlots: Int, type: Int, mobility: Int, style: Int, die: [[Int]], specialDice: [Int]) {
        
        self.name = name
        self.health = health
        self.curHealth = health
        self.attackSlots = attackSlots
        self.defenseSlots = defenseSlots
        self.recoverySlots = recoverySlots
        
        self.curAttackSlotContent = []
        self.curDefenseSlotContent = []
        self.curRecoverySlotContent = []

        self.die = die
        self.totalDie = die.count
        self.mobility = mobility
        self.specialDice = specialDice
        self.type = CharacterType(rawValue: type)
        self.style = CharacterStyle(rawValue: style)
        
    }
    
    /*-------------- Battle Time Methods ------------*/
    
    // modifies health
    func modHealth(xhealth: Int) -> Int{
        curHealth = curHealth + xhealth
        if(curHealth > health){
            curHealth = health
        }
        if(curHealth < 0){
            curHealth = 0
        }
        return curHealth
    }
    // Selects a random number from an array of Ints
    func rollDice(dice: [Int]) -> Int{
        return dice[Int(arc4random_uniform(UInt32(dice.count)))]
    }
    
    // Determines if the character is still alive (pergatory will effect this later)
    func isAlive() -> Bool{
        return curHealth > 0
    }
    
    /*----------------- Dice Trackers and Setters -------------------*/

    // checks to see if there are already a max number of attack dice in the attack slot
    func spaceAttackDice() -> Bool{
        return attackSlots != curAttackSlotContent.count
    }
    
    // checks to see if there are already a max number of Defense dice in the defense slot
    func spaceDefenseDice() -> Bool{
        return defenseSlots != curDefenseSlotContent.count
    }
    
    // checks to see if there are already a max number of recovery dice in the recovery slot
    func spaceRecoveryDice() -> Bool{
        return recoverySlots != curRecoverySlotContent.count
    }
    
    func stillHaveDie() -> Bool {
        return !die.isEmpty
    }
    
    // adds an attack dice to curAttackSlots and puts the actual dice in curAttackDiceContents
    func addAttackDice() -> Int{
        
        if(spaceAttackDice() && stillHaveDie()){
            curAttackSlotContent.append(nextDice())
        }
        return curAttackSlotContent.count
    }

    // adds an defense dice to curDefenseSlots and puts the actual dice in curDefenseDiceContents
    func addDefenseDice() -> Int{
        
        if(spaceDefenseDice() && stillHaveDie()){
            curDefenseSlotContent.append(nextDice())
        }
        return curDefenseSlotContent.count
    }
    
    // adds an recovery dice to curRecoverySlots and puts the actual dice in curRecoveryDiceContents
    func addRecoveryDice() -> Int{
        
        if(spaceRecoveryDice() && stillHaveDie()){
            curRecoverySlotContent.append(nextDice())
        }
        return curRecoverySlotContent.count
    }
    
    // resets all of the characters die
    func resetDie() {
        
        while !curAttackSlotContent.isEmpty {
            die.append(curAttackSlotContent.removeLast())
        }
        
        while !curRecoverySlotContent.isEmpty {
            die.append(curRecoverySlotContent.removeLast())
        }
        
        while !curDefenseSlotContent.isEmpty {
            die.append(curDefenseSlotContent.removeLast())
        }
    }

    /*--------- utilities ----------*/
    
    // removes a die from the characters bank and returns in
    // ONLY CALL THIS IF YOU STILL HAVE DIE
    private func nextDice() -> [Int]{
        return die.removeLast()
    }
}






