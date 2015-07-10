//
//  Battleground.swift
//  RollingThunder
//
//  Created by Anthony Dario on 7/9/15.
//  Copyright (c) 2015 Anthony Dario. All rights reserved.
//

import UIKit

class Battleground: NSObject {
   
    // info
    var turn: Bool
    
    // Formations
    var level: [Formation]
    var playerFormation: Formation

    //loot

    init(level: [Formation], playerFormation player: Formation) {
        
        self.level = level
        playerFormation = player
        turn = true
    }
}
