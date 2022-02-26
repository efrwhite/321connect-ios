//
//  Journal.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

class Journal{
    var journalID : Int = 0
    var childID : Int = 0
    var title : String = ""
    var notes : String = ""
 
    init(journalID:Int,childID:Int,title:String, notes:String){
        self.journalID = journalID
        self.childID = childID
        self.title  = title
        self.notes = notes
        
    }
}
