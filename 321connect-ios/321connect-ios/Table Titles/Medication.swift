//
//  Medication.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Medication{
    var medID : Int = 0
    var childID : Int = 0
    var medName: String = ""
    var medDosage : Int = 0 //What does it mean to be number can this just be int?
    var medDosageUnits : String = ""
    var medFrequency : String = ""
    var medReason: String = ""
    
    init(medID:Int, childID:Int,medName:String, medDosage:Int, medDosageUnits:String,medFrequency:String, medReason:String){
        self.medID = medID
        self.childID = childID
        self.medName = medName
        self.medDosage = medDosage
        self.medDosageUnits = medDosageUnits
        self.medFrequency = medFrequency
        self.medReason = medReason
        
    }
}
