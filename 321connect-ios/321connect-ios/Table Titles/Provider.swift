//
//  Provider.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Provider{
    var providerID: Int = 0 //Primary key
    var providerName:String = ""
    var practiceName:String = ""
    var specialty: String  = ""
    var phone:String = ""
    var fax: String = ""
    var email: String = ""
    var website: String = ""
    var address: String = ""
    var state: String = ""
    var city: String = ""
    var zip: String = ""
 
    
    
    
 
    init(providerID:Int,providerName:String,practiceName:String,specialty:String,phone:String,fax:String,email:String, website:String, address:String, state:String, city:String, zip: String){
    self.providerID = providerID
    self.providerName = providerName
    self.practiceName = practiceName
    self.specialty = specialty
    self.phone = phone
    self.fax = fax
    self.email = email
    self.website = website
    self.address = address
    self.state = state
    self.city = city
    self.zip = zip    
   }
}
