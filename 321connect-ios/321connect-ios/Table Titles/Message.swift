//
//  Message.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Message{
    var messageID : Int = 0
    var childID : Int = 0 //foreign key
    var message : String = ""
    
    init(messageID:Int, childID:Int, message:String){
        self.messageID = messageID
        self.childID = childID
        self.message = message
    }
}
