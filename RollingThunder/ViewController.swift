//
//  ViewController.swift
//  RollingThunder
//
//  Created by Anthony Dario on 7/9/15.
//  Copyright (c) 2015 Anthony Dario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var die = [1, 2, 3, 4, 5, 6]
        
        //characters
        var nero = Character(name: "Nero",health: 20, attackSlots: 2, defenseSlots: 1, recoverySlots: 1, type: 3, mobility: 1, style: 1, dice: [die, die], specialDice: die)
        
        var dante = Character(name: "Dante", health: 20, attackSlots: 1, defenseSlots: 2, recoverySlots: 1, type: 1, mobility: 1, style: 2, dice: [die, die], specialDice: die)
        
        var blackHand: Monster = Monster(attack: [10, 15], health: 100)
        
        // we need player formation with 2 characters
        var pForm: Formation = Formation(field: [[nero, dante]])
        
        // we need an enemy formation
        var eForm: Formation = Formation(field: [[blackHand]])
        
        //battleground
        var battleground = Battleground(level: [eForm], playerFormation: pForm)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

