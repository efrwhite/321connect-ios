//
//  ConstipationViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//

import Foundation
import UIKit

class ConstipationViewController: UIViewController {
    @IBOutlet weak var ConstiNotes: UITextView!
    @IBOutlet weak var DoLSConsti: UIDatePicker!
    @IBOutlet weak var TreatPlan: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
   

    @IBAction func ConstiSaveButton(_ sender: Any) {
        let ConstipationDate = DoLSConsti.date
        let notes = ConstiNotes.text
        let TreatmentPlan = TreatPlan.text
        print("\(notes),\(TreatmentPlan)")
        print(ConstipationDate)
        
        
    }
}

