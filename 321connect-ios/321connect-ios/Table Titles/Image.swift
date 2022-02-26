//
//  Image.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/24/22.
//

import Foundation

import SQLite3
import UIKit
class Image{
    var imageID: Int = 0
    var childID : Int = 0 //foreign key
    var image : UIImage?
    
    init(imageID:Int, childID:Int, image: UIImage?){
        self.imageID = imageID
        self.childID = childID
        self.image = image
        
        
    }
}
