//
//  PottyViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//

import Foundation
import UIKit

class PottyViewController: UIViewController {
    
    @IBOutlet weak var PottyNotes: UITextView!
    @IBOutlet weak var Accident: UISwitch!
    @IBOutlet weak var PottyDuration: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        PottyDuration.countDownDuration
    }
   
 
    @IBAction func SwitchChange(_ sender: UISwitch) {
        if sender.tag == 0{
            if Accident.isOn {
                print("Accident : Yes")
            }
            else{
                print("Accident: No")
            }
    }
    
    }
    @IBAction func SaveButton(_ sender: Any) {
        let duration_potty  = PottyDuration.countDownDuration
        let Notes_Potty = PottyNotes.text
 
        print("Duration:\(duration_potty), Notes: \(Notes_Potty)")
        
        
     }
}

