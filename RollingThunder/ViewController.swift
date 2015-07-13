//
//  ViewController.swift
//  RollingThunder
//
//  Created by Anthony Dario on 7/9/15.
//  Copyright (c) 2015 Anthony Dario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var attackSlots: UIButton!
    @IBOutlet weak var defenseSlots: UIButton!
    @IBOutlet weak var healingSlots: UIButton!
    
    @IBOutlet weak var numberDice: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var health: UILabel!
    
    @IBOutlet weak var characterGrid: UICollectionView!

    var battleground: Battleground!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.characterGrid.delegate = self
        
        var die = [1, 2, 3, 4, 5, 6]
        
        // characters
        var nero = Character(name: "Nero",health: 20, attackSlots: 2, defenseSlots: 1, recoverySlots: 1, type: 3, mobility: 1, style: 1, dice: [die, die], specialDice: die)
        
        var dante = Character(name: "Dante", health: 20, attackSlots: 1, defenseSlots: 2, recoverySlots: 1, type: 1, mobility: 1, style: 2, dice: [die, die], specialDice: die)
        
        // enemies
        var blackHand: Monster = Monster(mainAttack: [10, 15], health: 100, cdown: [1,2,3,])
        
        // we need player formation with 2 characters
        var pForm: Formation = Formation(characterField: [[nero, dante, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]])
        
        // we need an enemy formation
        var eForm: Formation = Formation(monsterField: [[blackHand]])
        
        // battleground
        battleground = Battleground(level: [eForm], playerFormation: pForm)
        
        characterGrid.registerClass(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "CharacterCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// provides data to the characters
extension ViewController : UICollectionViewDataSource {
    internal func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
    }
    
    internal func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 12
    }
    
    internal func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //create the cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CharacterCell", forIndexPath: indexPath) as! CharacterCollectionViewCell
        
        // Configure the cell
        cell.maxWidth = characterGrid.bounds.size.width
        
        cell.name = battleground.playerFormation.charField[0][indexPath.row] == nil ? "nil" : battleground.playerFormation.charField[0][indexPath.row]!.name
        
        return cell
    }
}

// provides the layout for the characters
extension ViewController : UICollectionViewDelegateFlowLayout {
    internal func collectionView(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var width = characterGrid.collectionViewLayout.collectionViewContentSize().width / 3 - 10
        
        return CGSize(width: width, height: width)
    }
    
    internal func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        //the selectedCell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CharacterCell", forIndexPath: indexPath) as! CharacterCollectionViewCell

        println(battleground.playerFormation.charField[0][indexPath.row]!.name)
        
    }
}



















