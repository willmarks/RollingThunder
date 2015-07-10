//
//  ViewController.swift
//  RollingThunder
//
//  Created by Anthony Dario on 7/9/15.
//  Copyright (c) 2015 Anthony Dario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var position1: UIButton!
    @IBOutlet weak var position2: UIButton!
    @IBOutlet weak var position3: UIButton!
    @IBOutlet weak var position4: UIButton!
    
    @IBOutlet weak var attackSlots: UIButton!
    @IBOutlet weak var defenseSlots: UIButton!
    @IBOutlet weak var healingSlots: UIButton!
    
    @IBOutlet weak var numberDice: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var health: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        var buttons = [[position1, position2, position3, position4]]
        
        var die = [1, 2, 3, 4, 5, 6]
        
        //characters
        var nero = Character(name: "Nero",health: 20, attackSlots: 2, defenseSlots: 1, recoverySlots: 1, type: 3, mobility: 1, style: 1, dice: [die, die], specialDice: die)
        
        var dante = Character(name: "Dante", health: 20, attackSlots: 1, defenseSlots: 2, recoverySlots: 1, type: 1, mobility: 1, style: 2, dice: [die, die], specialDice: die)
        
        var blackHand: Monster = Monster(attack: [10, 15], health: 100)
        
        // we need player formation with 2 characters
        var pForm: Formation = Formation(field: [[nero, dante]])
        
        // we need an enemy formation
        var eForm: Formation = Formation(field: [[blackHand]])
        
        // battleground
        var battleground = Battleground(level: [eForm], playerFormation: pForm)
        
        // updates buttons
        for (var i = 0; i < battleground.playerFormation.charField.count; i++) {
            for (var j = 0; j < battleground.playerFormation.charField[i].count; j++) {
                
                println("row: \(i), column: \(j) row length: \(battleground.playerFormation.charField[i].count)")
                
                buttons[i][j].setTitle(battleground.playerFormation.charField[i][j].name, forState: .Normal)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

