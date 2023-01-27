//
//  DevelopmentViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//

import Foundation
import UIKit
import CoreData

class DevelopmentViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    
    // physical milestone dates
    @IBOutlet weak var physicalRollDate: UIDatePicker!
    @IBOutlet weak var physicalSitDate: UIDatePicker!
    @IBOutlet weak var physicalCrawlsDate: UIDatePicker!
    @IBOutlet weak var physicalStandingDate: UIDatePicker!
    @IBOutlet weak var physicalHoldingDate: UIDatePicker!
    @IBOutlet weak var physicalNoHoldDate: UIDatePicker!
    @IBOutlet weak var physicalJumpDate: UIDatePicker!
    
    // fine motor milestone dates
    @IBOutlet weak var motorHoldsObjDate: UIDatePicker!
    @IBOutlet weak var motorHandMouthDate: UIDatePicker!
    @IBOutlet weak var motorPassesDate: UIDatePicker!
    @IBOutlet weak var motorPincerDate: UIDatePicker!
    @IBOutlet weak var motorCupDate: UIDatePicker!
    @IBOutlet weak var motorScribbleDate: UIDatePicker!
    @IBOutlet weak var motorSpoonDate: UIDatePicker!
    
    // social milestone dates
    @IBOutlet weak var socialPointsDate: UIDatePicker!
    @IBOutlet weak var socialEmotionDate: UIDatePicker!
    @IBOutlet weak var socialAffectionDate: UIDatePicker!
    @IBOutlet weak var socialChildrenAffectionDate: UIDatePicker!
    
    // verbal milestone dates
    @IBOutlet weak var verbalCooDate: UIDatePicker!
    @IBOutlet weak var verbalBabbleDate: UIDatePicker!
    @IBOutlet weak var verbalWordDate: UIDatePicker!
    @IBOutlet weak var verbalSentenceDate: UIDatePicker!
    @IBOutlet weak var verbalLongDate: UIDatePicker!
    
    // hearing milestone dates
    @IBOutlet weak var hearingStartleDate: UIDatePicker!
    @IBOutlet weak var hearingSoundDate: UIDatePicker!
    
    @IBOutlet weak var notesField: UITextField!
    var receivedString = ""
    var user = ""
    
    var DevelopmentArray = [Development]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        print("Development Passed",receivedString)
        /* date data transfer from database to populate corresponding datepickers*/
        //here
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
//        let pRollDate = physicalRollDate.date
//        let pSitDate = physicalSitDate.date
//        let pCrawlsDate = physicalCrawlsDate.date
//        let pStandingDate = physicalStandingDate.date
//        let pHoldingDate = physicalHoldingDate.date
//        let pNoHoldDate = physicalNoHoldDate.date
//        let pJumpDate = physicalJumpDate.date
//
//        let mHoldsObjDate = motorHoldsObjDate.date
//        let mHandMouthDate = motorHandMouthDate.date
//        let mPassesDate = motorPassesDate.date
//        let mPincerDate = motorPincerDate.date
//        let mCupDate = motorCupDate.date
//        let mScribbleDate = motorScribbleDate.date
//        let mSpoonDate = motorSpoonDate.date
//
//        let sPointsDate = socialPointsDate.date
//        let sEmotionDate = socialEmotionDate.date
//        let sAffectionDate = socialAffectionDate.date
//        let sChildrenAffectionDate = socialChildrenAffectionDate.date
//
//        let vCooDate = verbalCooDate.date
//        let vBabbleDate = verbalBabbleDate.date
//        let vWordDate = verbalWordDate.date
//        let vSentenceDate = verbalSentenceDate.date
//        let vLongDate = verbalLongDate.date
//
//        let hearingStartleDate = hearingStartleDate.date
//        let hearingSoundDate = hearingSoundDate.date
        
        // database data does not transfer to populate notes field
        // append to data base coloumn 
//        let notesField = notesField.text
        
        let new_development = Development(context: self.context)
        new_development.username = receivedString
        new_development.firstRoll = physicalRollDate.date
        new_development.firstSit = physicalSitDate.date
        new_development.firstCrawl = physicalCrawlsDate.date
        new_development.firstPull = physicalStandingDate.date
        new_development.firstNoHandWalk = physicalNoHoldDate.date
        new_development.firstWalk = physicalHoldingDate.date
        new_development.firstJump = physicalJumpDate.date
        new_development.firstHoldsObject = motorHoldsObjDate.date
        new_development.firstHandMouth = motorHandMouthDate.date
        new_development.firstPassObject = motorPassesDate.date
        new_development.firstPincher = motorPincerDate.date
        new_development.firstDrink = motorCupDate.date
        new_development.firstScribble = motorScribbleDate.date
        new_development.firstFeedSpoon = motorSpoonDate.date
        new_development.firstPoint = socialPointsDate.date
        new_development.firstEmotion = socialEmotionDate.date
        new_development.firstAffection = socialAffectionDate.date
        new_development.firstInterest = socialChildrenAffectionDate.date
        new_development.firstCoos = verbalCooDate.date
        new_development.firstBabbles = verbalBabbleDate.date
        new_development.firstWord = verbalWordDate.date
        new_development.firstTwoWords = verbalSentenceDate.date
        new_development.firstSentence = verbalLongDate.date
        new_development.firstStartle = hearingStartleDate.date
        new_development.firstInterestSound = hearingSoundDate.date
        new_development.notes = notesField.text
        
    
        self.DevelopmentArray.append(new_development)
        self.SaveItems()
    }
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        let request : NSFetchRequest<Development> = Development.fetchRequest()
        do{
            DevelopmentArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}

