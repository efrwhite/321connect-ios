//
//  DevelopmentViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//

import Foundation
import UIKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /* date data transfer from database to populate corresponding datepickers*/
        //here
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        let pRollDate = physicalRollDate.date
        let pSitDate = physicalSitDate.date
        let pCrawlsDate = physicalCrawlsDate.date
        let pStandingDate = physicalStandingDate.date
        let pHoldingDate = physicalHoldingDate.date
        let pNoHoldDate = physicalNoHoldDate.date
        let pJumpDate = physicalJumpDate.date
        
        let mHoldsObjDate = motorHoldsObjDate.date
        let mHandMouthDate = motorHandMouthDate.date
        let mPassesDate = motorPassesDate.date
        let mPincerDate = motorPincerDate.date
        let mCupDate = motorCupDate.date
        let mScribbleDate = motorScribbleDate.date
        let mSpoonDate = motorSpoonDate.date
        
        let sPointsDate = socialPointsDate.date
        let sEmotionDate = socialEmotionDate.date
        let sAffectionDate = socialAffectionDate.date
        let sChildrenAffectionDate = socialChildrenAffectionDate.date
        
        let vCooDate = verbalCooDate.date
        let vBabbleDate = verbalBabbleDate.date
        let vWordDate = verbalWordDate.date
        let vSentenceDate = verbalSentenceDate.date
        let vLongDate = verbalLongDate.date
        
        let hearingStartleDate = hearingStartleDate.date
        let hearingSoundDate = hearingSoundDate.date
        
        // database data does not transfer to populate notes field
        // append to data base coloumn 
        let notesField = notesField.text
    }
    
}

