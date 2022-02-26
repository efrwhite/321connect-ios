//
//  Medical.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Medical{
    var medicalID: Int = 0 //Primary key
    var childID:Int = 0 //Foreign key
    var height:String = ""
    var weight:String = ""
    var headSize: String  = ""
    var doctorsVisit :Int = 0
    var temperature: String = ""
    var provider: String = ""
    var vistNum: String = ""
    var providerType: String = ""
    var checkAnswers: String = ""
    var appointmentDates: String = ""
    var appointmentProviders: String = ""
    var notes: String = ""

    init(medicalID:Int,childID:Int,height:String,weight:String,headSize:String,doctorsVisit:Int,temperature:String,provider:String, vistNum:String, providerType:String, checkAnswers:String, appointmentDates:String, appointmentProviders: String, notes:String){
    self.medicalID = medicalID
    self.childID = childID
    self.height = height
    self.weight  = weight
    self.headSize = headSize
    self.doctorsVisit = doctorsVisit
    self.temperature = temperature
    self.provider = provider
    self.vistNum = vistNum
    self.providerType = providerType
    self.checkAnswers = checkAnswers
    self.appointmentDates = appointmentDates
    self.appointmentProviders = appointmentProviders
    self.notes  = notes
    
   }
}
