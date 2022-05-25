//
//  Account.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Account{
    var firstName:String = ""
    var lastName:String = ""
    var userName:String = ""
    var passWord:String = ""
    var confirmPassword:String = ""
    var accountHolderID: Int = Primary Key AUTOINCREMENT // here
    var phone :String = ""
    
 
    init (firstName:String, lastName:String,
          userName:String, passWord:String, confirmPassword:String, phone:String){
        
    self.accountHolderID += 1;
    self.firstName = firstName
    self.lastName  = lastName
    self.userName = userName
    self.passWord = passWord
    self.confirmPassword = confirmPassword
    self.phone = phone
    }

}
