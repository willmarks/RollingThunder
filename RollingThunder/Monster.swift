//
//  Monster.swift
//  RollingThunder
//
//  Created by Anthony Dario on 7/9/15.
//  Copyright (c) 2015 Anthony Dario. All rights reserved.
//

import UIKit

class Monster: NSObject {
   
    // info
    var name: String
    
    // stats
    var health: Int!
    var curHealth: Int!
    var cooldown: [Int]
    var mainAttack: [Int]!
    
    // skills
    // special attack
    
    init(mainAttack: [Int], health: Int, cdown: [Int], name: String) {
        
        self.name = name
        self.health = health
        self.cooldown = cdown
        self.curHealth = health
        self.mainAttack = mainAttack
    }
    
    /*---------- Battle Time Methods ----------*/
    
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
    
    func mainAttack(turn: Int, formation: Formation) -> (Int,Int,[Int]){
        return (mainAttack[turn],cooldown[turn],formation.getRanAliveChar())
    }
    
    // determines if the monster is alive
    func isAlive() -> Bool {
        return curHealth > 0
    }
    
}
