//
//  Child.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Child{
    var childID:Int = 0
    var firstName:String = ""
    var lastName:String = ""
    var gender:String = ""
    var bloodType:String = ""
    var dueDate: Int = 0
    var birthday :Int = 0
    var allergies: String = ""
    var medications: String = ""
    
    
 
    init(childID:Int,firstName:String,lastName:String,gender:String,bloodType:String,dueDate:Int,birthday:Int, allergies:String, medications:String){
    self.childID = childID
    self.firstName = firstName
    self.lastName  = lastName
    self.gender = gender
    self.bloodType = bloodType
    self.dueDate = dueDate
    self.birthday = birthday
    self.allergies = allergies
    self.medications = medications    
   }

}
