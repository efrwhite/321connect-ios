//
//  Mood.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Mood{
    var moodID: Int = 0 //Primary key
    var childID:Int = 0 //Foreign key
    var moodType:String = ""
    var time:String = ""
    var notes: String  = ""
    var units :String = ""
   
    
    
 
    init(moodID:Int,childID:Int,moodType:String,time:String,notes:String,units:String){
    self.moodID = moodID
    self.childID = childID
    self.moodType = moodType
    self.time  = time
    self.notes = notes
    self.units = units
    }
    
}
