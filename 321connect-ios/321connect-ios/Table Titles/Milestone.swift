//
//  Milestone.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/24/22.
//

import Foundation

class Milestone {
    var mileStoneID: Int = 0 //Primary key
    var childID:Int = 0 //Foreign key
    var roll:String = ""
    var walk:String = ""
    var stand: String  = ""
    var sit :String = ""
    var crawl: String = ""
    var noHandWalk: String = ""
    var jump: String = ""
    var holds: String = ""
    var handMouth: String = ""
    var passes: String = ""
    var pincher: String = ""
    var drinks: String = ""
    var scribbles: String = ""
    var spoonFeed: String = ""
    var points: String = ""
    var emotion: String = ""
    var affection: String = ""
    var interest: String = ""
    var coos: String = ""
    var babbles: String = ""
    var speaks: String = ""
    var twoWords : String = ""
    var sentence: String = ""
    var startles: String = ""
    var turns: String = ""
    
    
    
 
    init(mileStoneID:Int,childID:Int,roll:String,walk:String,stand:String,sit:String,crawl:String,noHandWalk:String, jump:String, holds:String, handMouth:String, passes:String, pincher: String, drinks:String, scribbles:String, spoonFeed:String, points:String, emotion:String, affection:String, interest:String, coos:String, babbles:String, speaks:String, twoWords:String, sentence:String, startles:String, turns:String){
        self.mileStoneID = mileStoneID
        self.childID = childID //foreign key
        self.roll = roll
        self.walk = walk
        self.stand = stand
        self.sit = sit
        self.crawl = crawl
        self.noHandWalk = noHandWalk
        self.jump = jump
        self.holds = holds
        self.handMouth = handMouth
        self.passes = passes
        self.pincher = pincher
        self.drinks = drinks
        self.scribbles = scribbles
        self.spoonFeed = spoonFeed
        self.points = points
        self.emotion = emotion
        self.affection = affection
        self.interest = interest
        self.coos = coos
        self.babbles = babbles
        self.speaks = speaks
        self.twoWords = twoWords
        self.sentence = sentence
        self.startles = startles
        self.turns = turns
        
    }
}
