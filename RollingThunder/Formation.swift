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
    var monsterField: [[Monster]]!
    
    init(characterField: [[Character?]]) {
        
        self.charField = characterField
    }
    
    init(monsterField: [[Monster]]) {
        self.monsterField = monsterField
    }
    
    
    /*######### Battle Time Methods ##########*/
    
    //returns positions [(x,y)] of alive characters in formation
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
    
    //return the location (x,y) of one random character
    func getRanAliveChar() -> [Int]{
        var locations: [[Int]]! = self.getAliveCharLoc()
        return locations[Int(arc4random_uniform(UInt32(locations.count)))]
    }
    
    //returns true if all characters are dead in the formation
    func allDead() -> Bool{
        if(getAliveCharLoc()!.count == 1){
            return true
        }else{
            return false
        }
    }
}




