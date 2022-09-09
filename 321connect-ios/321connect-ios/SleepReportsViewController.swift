//
//  SleepReportsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/1/22.
//

import UIKit

class SleepReportsViewController: UIViewController {
    
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var durationPicker: UIDatePicker!
    @IBOutlet weak var sleepNotesView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
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
    
    lazy var sleepCycleVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SleepCycleViewController")
    
    var timer = Timer()
    
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
    
    @IBAction func saveTapped(_ sender: UIButton) {
        let notesText = sleepNotesView.text!
        let sleepDate = dateTimePicker.date
        let sleepTime = dateTimePicker.countDownDuration

        
        if (snoreSwitch.isOn == true) {
            let snoreHistory = "YES"
        } else {
            let snoreHistory = "NO"
        }

        // ********** print to console ****************
        print("SLEEP DATE: \(sleepDate)")
        print("SLEEP TIME: \(sleepTime)")
//        print("NOTES: \(notesText)")
//        print("SNORE HISTORY: \(snoreHistory)")
        // ********** print to console ****************

    }
    
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
