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
    var health: Int!
    var attackSlots: Int!
    var defenseSlots: Int!
    var recoverySlots: Int!
    var type: CharacterType!
    var mobility: Int!
    var style: CharacterStyle!
    
    // dice
    var specialDice: [Int]!
    var dice: [[Int]]!
    
    // skill
    //var leaderSkill: leaderSkill
    //var activeSkill: activeSkill
    //var traits: Trait
    
    
    init(name: String, health: Int, attackSlots: Int, defenseSlots: Int, recoverySlots: Int, type: Int, mobility: Int, style: Int, dice: [[Int]], specialDice: [Int]) {
        
        self.name = name
        self.health = health
        self.attackSlots = attackSlots
        self.defenseSlots = defenseSlots
        self.recoverySlots = recoverySlots
        self.type = CharacterType(rawValue: type)
        self.mobility = mobility
        self.style = CharacterStyle(rawValue: style)
        self.dice = dice
        self.specialDice = specialDice
    }
    
}
