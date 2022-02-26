//
//  Entry.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Entry{
    var entryID: Int = 0 //Primary key
    var childID:Int = 0 //Foreign key
    var entryText:Int = 0
    var entryType:String = ""
    var foreignID: Int  = 0
    
    
 
    init(entryID:Int,childID:Int,entryText:Int,entryType:String,foreignID:Int){
    self.entryID = entryID
    self.childID = childID
    self.entryText = entryText
    self.entryType  = entryType
    self.foreignID = foreignID
   }
}
