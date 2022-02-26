//
//  Activity.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Activity{
    var activityID: Int = 0 //Primary key
    var childID:String = ""
    var activityName:String = ""
    var entryTime: Int  = 0
    var duration:String = ""
    var durationUnits: String = ""
    var notes: String = ""
    
    
    init(activityID:Int,childID:String,activityName:String,entryTime:Int,duration:String,durationUnits:String,notes:String){
    self.activityID = activityID
    self.childID = childID
    self.activityName = activityName
    self.entryTime = entryTime
    self.duration = duration
    self.durationUnits = durationUnits
    self.notes = notes
   
    
    
   }
}
