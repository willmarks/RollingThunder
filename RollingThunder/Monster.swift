//
//  Monster.swift
//  RollingThunder
//
//  Created by Anthony Dario on 7/9/15.
//  Copyright (c) 2015 Anthony Dario. All rights reserved.
//

import UIKit

class Monster: NSObject {
   
    
    // stats
    var mainAttack: [Int]!
    var health: Int!
    var curHealth: Int!
    
    // skills
    // special attack
    
    init(mainAttack: [Int], health: Int) {
        self.mainAttack = mainAttack
        self.health = health
    }
    
    /*############# MODIFIERS ############*/
    
    //modifies health
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
    
    func attack(turn: Int, formation: Formation) -> (Int,[Int]){
        return (mainAttack[turn],formation.getRanAliveChar())
    }
    
    
}
