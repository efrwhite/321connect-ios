//
//  Sleep.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Sleep{
    var sleepID: Int = 0 //Primary key
    var childID:Int = 0 //Foreign key
    var sleepTime:Int = 0
    var duration:Int = 0
    var snoring: String  = ""
    var medication :String = ""
    var supplements: String = ""
    var cPAP: String = ""
    var other: String = ""
    var study: String = ""
    var unit: String = ""
    var notes: String = ""
    var sleepDate: String = ""
    
    
    
 
    init(sleepID:Int,childID:Int,sleepTime:Int,duration:Int,snoring:String,medication:String,supplements:String,cPAP:String, other:String, study:String, unit:String, notes:String, sleepDate:String){
    self.sleepID = sleepID
    self.childID = childID
    self.sleepTime = sleepTime
    self.duration  = duration
    self.snoring = snoring
    self.medication = medication
    self.supplements = supplements
    self.cPAP = cPAP
    self.other = other
    self.unit = unit
    self.notes = notes
    self.sleepDate = sleepDate
   }
}
