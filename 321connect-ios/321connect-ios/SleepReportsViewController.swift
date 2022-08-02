//
//  SleepReportsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/1/22.
//

import UIKit

class SleepReportsViewController: UIViewController {
    
    // switches
    @IBOutlet weak var snoreSwitch: UISwitch!
    @IBOutlet weak var treatmentsSwitch: UISwitch!
    @IBOutlet weak var sleepStudySwitch: UISwitch!
    
    // sleep treatment toggles
    @IBOutlet weak var medicationToggle: UIButton!
    @IBOutlet weak var supplementsToggle: UIButton!
    @IBOutlet weak var cpapToggle: UIButton!
    @IBOutlet weak var otherToggle: UIButton!
    @IBOutlet weak var indicateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indicateTextField.isHidden = true
        medicationToggle.isEnabled = false
        supplementsToggle.isEnabled = false
        cpapToggle.isEnabled = false
        otherToggle.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Button Functions
     */
    
    @IBAction func treatmentsChanged(_ sender: Any) {
        if treatmentsSwitch.isOn == true {
            medicationToggle.isEnabled = true
            supplementsToggle.isEnabled = true
            cpapToggle.isEnabled = true
            otherToggle.isEnabled = true
        } else {
            medicationToggle.isEnabled = false
            supplementsToggle.isEnabled = false
            cpapToggle.isEnabled = false
            otherToggle.isEnabled = false
        }
    }
    
    @IBAction func otherChanged(_ sender: Any) {
        if otherToggle.isSelected == false {
            indicateTextField.isHidden = true
        } else {
            indicateTextField.isHidden = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
