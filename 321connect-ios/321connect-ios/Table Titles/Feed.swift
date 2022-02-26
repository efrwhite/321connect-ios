//
//  Feed.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Feed{
    var feedID: Int = 0 //Primary key
    var childID:Int = 0 //Foreign key
    var amount:Int = 0
    var substance:String = ""
    var notes: String  = ""
    var foodUnit :String = ""
    var entryTime: Int = 0
    var iron: String = ""
    var vitamin: String = ""
    var other: String = ""
    var eatMode: String = ""
    
    
 
    init(feedID:Int,childID:Int,amount:Int,substance:String,notes:String,foodUnit:String,entryTime:Int,iron:String, vitamin:String, other:String, eatMode:String){
    self.feedID = feedID
    self.childID = childID
    self.amount = amount
    self.substance  = substance
    self.notes = notes
    self.foodUnit = foodUnit
    self.entryTime = entryTime
    self.iron = iron
    self.vitamin = vitamin
    self.other = other
    self.eatMode = eatMode
   }
    
}
