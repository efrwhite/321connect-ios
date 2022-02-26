//
//  Bathroom.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Bathroom{
    var bathRoomID: Int = 0 //Primary key
    var childID:Int = 0 //Foreign key
    var bathroomType:String = ""
    var treatment:String = ""
    var leak: String  = ""
    var openAir :Int = 0
    var diaperCream: String = ""
    var quantity: String = ""
    var pottyAccident: String = ""
    var dateOfLastStool: Int = 0
    var duration: String = ""
    
    
    
    
 
    init(bathRoomID:Int,childID:Int,bathroomType:String,treatment:String,leak:String,openAir:Int,diaperCream:String,quantity:String, pottyAccident:String, dateOfLastStool:Int, duration:String){
    self.bathRoomID = bathRoomID
    self.childID = childID
    self.bathroomType = bathroomType
    self.treatment  = treatment
    self.leak = leak
    self.openAir = openAir
    self.diaperCream = diaperCream
    self.quantity = quantity
    self.pottyAccident = pottyAccident
    self.dateOfLastStool = dateOfLastStool
    self.duration = duration
   }
}
