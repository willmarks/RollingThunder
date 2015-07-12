//
//  Formation.swift
//  RollingThunder
//
//  Created by Anthony Dario on 7/9/15.
//  Copyright (c) 2015 Anthony Dario. All rights reserved.
//

import UIKit

class Formation: NSObject {
   
    
    // characters
    var charField: [[Character]]!
    var monsterField: [[Monster]]!
    
    init(characterField: [[Character]]) {
        
        self.charField = characterField
    }
    
    init(monsterField: [[Monster]]) {
        self.monsterField = monsterField
    }
}
