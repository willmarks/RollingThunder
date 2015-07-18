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

    @IBOutlet weak var enemyLabel: UILabel!
    
    var battleground: Battleground!
    var currentCell: CharacterCollectionViewCell?
    var currentIndexPath: NSIndexPath?
    
    //probably gonna remove this later
    var die: [Int]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        /*----------------- testing stuff -------------------*/
        
        die = [1, 2, 3, 4, 5, 6]
        
        // characters
        var nero = Character(name: "Nero",health: 40, attackSlots: 2, defenseSlots: 1, recoverySlots: 1, type: 3, mobility: 1, style: 1, die: [die, die, die], specialDice: die)
        var dante = Character(name: "Dante", health: 20, attackSlots: 1, defenseSlots: 2, recoverySlots: 1, type: 1, mobility: 1, style: 2, die: [die, die], specialDice: die)
        
        // enemies
        var blackHand: Monster = Monster(mainAttack: [10, 15], health: 100, cdown: [1,2,3,], name: "Black Hand")
        
        // formations
        var playerForm: Formation = Formation(characterField: [[nero, dante, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]])
        var enemyForm: Formation = Formation(monsterField: [[blackHand, nil, nil, blackHand, nil, nil, blackHand, nil, nil, blackHand, nil, nil]])
        
        /*----------------- testing stuff -------------------*/
        
        // battleground
        battleground = Battleground(level: [enemyForm], playerFormation: playerForm)
        
        
        // collection view stuff
        
        self.initializeCharacterGrid()
        

        // enemy label stuff
        self.enemyLabel.numberOfLines = 0
        self.enemyLabel.text = battleground.level[0].monsterString()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // when the attack button is pressed move a die in
    @IBAction func attackDiePressed(sender: AnyObject) {
        
        if let character = getSelectedCharacter() {
            
            character.addAttackDice()
            updateUI(character)
        }
    }
    
    // when the health button is pressed move a die in
    @IBAction func healthDiePressed(sender: AnyObject) {
        
        if let character = getSelectedCharacter() {
            
            character.addRecoveryDice()
            updateUI(character)
        }
    }
    
    // when the defense button is pressed move a die in
    @IBAction func defenseDiePressed(sender: AnyObject) {
        
        if let character = getSelectedCharacter() {
            
            character.addDefenseDice()
            updateUI(character)
        }
    }
    
    // resets the selected characters die
    @IBAction func resetButtonPressed(sender: AnyObject) {
        
        if let character = getSelectedCharacter() {
            character.resetDie()
            updateUI(character)
        }
    }
    
    /*------------ utlities --------------*/
    
    // gets the currently selected character
    private func getSelectedCharacter() -> Character? {
    
        if currentCell != nil {
            let character: Character? = battleground.playerFormation.charField[0][currentIndexPath!.row]
            return character
        }
        return nil
    }
    
    // sets up the UICollectionView
    private func initializeCharacterGrid() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        var width = characterGrid.collectionViewLayout.collectionViewContentSize().width / 3
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: width, height: width)
                
        self.characterGrid.delegate = self
        self.characterGrid.scrollEnabled = false
        self.characterGrid.collectionViewLayout = layout
        self.characterGrid.allowsMultipleSelection = false
        characterGrid.registerClass(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "CharacterCell")
        
    }
    
    // updates all the labels for the UI
    private func updateUI(character: Character) {
        
        name.text = character.name
        health.text = "\(character.health)/\(character.curHealth)"
        numberDice.text = ("Die: \(character.die.count)/\(character.totalDie)")
        attackSlots.setTitle("\(character.curAttackSlotContent.count)/\(character.attackSlots)", forState: .Normal)
        defenseSlots.setTitle("\(character.curDefenseSlotContent.count)/\(character.defenseSlots)", forState: .Normal)
        healingSlots.setTitle("\(character.curRecoverySlotContent.count)/\(character.recoverySlots)", forState: .Normal)
    }
    
}

// provides data to the characters
extension ViewController : UICollectionViewDataSource {
    
    // the number of sections in the view
    internal func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
    }
    
    // the number of cells in a section
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
    
    // if a character cell is selected
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // the selected Cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CharacterCell", forIndexPath: indexPath) as! CharacterCollectionViewCell

        currentCell = cell
        currentIndexPath = indexPath
        
        if let character = battleground.playerFormation.charField[0][indexPath.row] {
            updateUI(character)
            
        }
    }
}



















