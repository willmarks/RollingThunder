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
    var charField: [[Character?]]!
    var monsterField: [[Monster?]]!
    
    init(characterField: [[Character?]]) {
        
        self.charField = characterField
    }
    
    init(monsterField: [[Monster?]]) {
        self.monsterField = monsterField
    }
    
    
    /*--------- Battle Time Methods ---------*/

    // returns positions [(x,y)] of alive characters in formation
    func getAliveCharLoc() -> [[Int]]?{
        var location: [[Int]] = [[-1,-1]]
        var position: [Int] = [0,0]
        
        for(var i=0; i < charField.count; i++){
            for(var j=0; j < charField[i].count; j++){
                if(charField[i][j] != nil){
                    if(charField[i][j]!.isAlive()){
                        position = [i,j]
                        location.append(position)
                    }
                }
            }
        }
        return location
    }
    
    // return the location (x,y) of one random character
    func getRanAliveChar() -> [Int]{
        var locations: [[Int]]! = self.getAliveCharLoc()
        return locations[Int(arc4random_uniform(UInt32(locations.count)))]
    }
    
    // returns true if all characters are dead in the formation
    func allDead() -> Bool{
        if(getAliveCharLoc()!.count == 1){
            return true
        }else{
            return false
        }
    }
    
    /*--------- Utlities ---------*/
    
    // the number of monsters in the formation
    func numberOfMonsters() -> Int {
        
        var count = 0
        
        for row in monsterField {
            for monster in row {
                if monster != nil {
                    count++
                }
            }
        }
        
        return count
    }
    
    // returns a string of all the monsters
    func monsterString() -> String {
        
        var monsterString = ""
        
        for row in monsterField {
            for monster in row {
                if monster != nil {
                    monsterString += "\(monster!.name): \(monster!.curHealth) \n"
                }
            }
        }
        
        return monsterString
    }
}




