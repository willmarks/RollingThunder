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
    var attack: [Int]!
    var health: Int!
    var curHealth: Int!
    
    // skills
    // special attack
    
    init(attack: [Int], health: Int) {
        self.attack = attack
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
    
    
    
}
