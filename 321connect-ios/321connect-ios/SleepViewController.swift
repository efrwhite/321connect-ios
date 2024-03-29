//
//  SleepViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//

import Foundation
import UIKit
import CoreData

class SleepViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
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
    var SleepArray = [Sleep]()
    var receivedString = ""
    var user = ""
    var userchild = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dateFormatter = DateFormatter()
    //Edward I changed this down into the function since I cant pass data without changing this
//    lazy var sleepCycleVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SleepCycleViewController")
    
    var timer = Timer()
    
    override func viewDidLoad(){
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        indicateTextField.isHidden = true
        medicationToggle.isEnabled = false
        supplementsToggle.isEnabled = false
        cpapToggle.isEnabled = false
        otherToggle.isEnabled = false
        
        sleepNotesView.layer.cornerRadius = 10
        sleepNotesView.clipsToBounds = true
        sleepNotesView.layer.borderWidth = 1
        sleepNotesView.layer.borderColor = UIColor.black.cgColor
        
        indicateTextField.isEnabled = false
        indicateTextField.placeholder = ""
        receivedString = user
        print("SLEEP Passed:", receivedString,"and Child: ", userchild)
        
        /* *** dynamic label current time/date *** */
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
            timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        
        // Gesture to collapse/dismiss keyboard on click outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)

        }

        @objc func tick() {
            dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
            timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
        }
        /* *** source: https://www.youtube.com/watch?v=9UovPNh4Csw *** */
    
    /*
     // MARK: - Button Functions
     */
    


    @IBAction func sleepCycleTapped(_ sender: Any) {
        print("Sleep Cycle Button Tapped") //debug
        let sleepCycleVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SleepCycleViewController") as! SleepCycleViewController
        // half bottom sheet presentation. Cycle calculator VC
        if let sheet = sleepCycleVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sleepCycleVC.userchild = userchild
            sleepCycleVC.user = receivedString

        }
        
        
        self.present(sleepCycleVC, animated: true, completion: nil)
    }
    
    // textview keyboard collapse on enter char
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    // Enter dismisses keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // dismiss Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
//        let notesText = sleepNotesView.text!
        let sleepDate = dateTimePicker.date
        dateFormatter.dateFormat = "MM/dd/YY"
        let stringsleepDate = dateFormatter.string(from:sleepDate)

        // here are alerts for success or errors on view at save tapped
        if indicateTextField.text!.isEmpty && indicateTextField.isEnabled && supplementsToggle.isEnabled{
            let alert = UIAlertController(title: "Error", message: "Please indicate the sleep supplements used", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(OKAction)
            present(alert, animated: true)
        } else {
            let date = Date()

            // Create Date Formatter
            let dateFormatter = DateFormatter()
            let calendar = Calendar.current
            let new_sleep = Sleep(context: self.context)
            new_sleep.username = receivedString
            new_sleep.childName = userchild
            new_sleep.notes = sleepNotesView.text
            new_sleep.sleepDate = stringsleepDate
            new_sleep.duration = durationPicker.countDownDuration
            new_sleep.unit = "Seconds"
            new_sleep.snoring = snoreSwitch.isOn
            new_sleep.sleepTreatment = treatmentsSwitch.isOn
            new_sleep.medication = medicationToggle.isEnabled
            new_sleep.supplements = supplementsToggle.isEnabled
            new_sleep.cPAP = cpapToggle.isEnabled
            new_sleep.other = otherToggle.isEnabled
            new_sleep.otherNote = indicateTextField.text
            new_sleep.study = sleepStudySwitch.isOn
            new_sleep.currentdate = Date()
            print("THIS IS SLEEP ARRAY", SleepArray)
            
            let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.SleepArray.append(new_sleep)
                self.SaveItems()
                self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(OKAction)
            present(alert, animated: true)
        }

        // ********** print to console ****************
//        print("SLEEP DATE: \(sleepDate)")
//        print("SLEEP TIME: \(sleepTime)")
//        print("NOTES: \(notesText)")
//        print("SNORE HISTORY: \(snoreHistory)")
        // ********** print to console ****************
//        let new_sleep = Sleep(context: self.context)
//        new_sleep.username = receivedString
//        new_sleep.notes = sleepNotesView.text
//        new_sleep.sleepDate = stringsleepDate
//        new_sleep.duration = durationPicker.countDownDuration
//        new_sleep.unit = "Seconds"
//        new_sleep.snoring = snoreSwitch.isOn
//        new_sleep.sleepTreatment = treatmentsSwitch.isOn
//        new_sleep.medication = medicationToggle.isEnabled
//        new_sleep.supplements = supplementsToggle.isEnabled
//        new_sleep.cPAP = cpapToggle.isEnabled
//        new_sleep.other = otherToggle.isEnabled
//        new_sleep.otherNote = indicateTextField.text
//        new_sleep.study = sleepStudySwitch.isOn
//
//        self.SleepArray.append(new_sleep)
//        self.SaveItems()
//        print("THIS IS SLEEP ARRAY", SleepArray)

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
        if otherToggle.isSelected == true {
            indicateTextField.isEnabled = true
            indicateTextField.placeholder = "Please indicate"
        } else {
            indicateTextField.isEnabled = false
            indicateTextField.placeholder = ""

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SleepViewSegue2"){
            let displayVC = segue.destination as! HomeScreenViewControllerExt
            displayVC.user = receivedString
        }
            if (segue.identifier == "SleepViewSegue"){
                let displayVC = segue.destination as! HomeScreenViewController
                displayVC.user = receivedString
            }
        
    }
    
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        let request : NSFetchRequest<Sleep> = Sleep.fetchRequest()
        do{
        SleepArray = try context.fetch(request)
        print("This is SLEEP ARRAY:",SleepArray)
        } catch{
            print("Error fetching data \(error)")
        }
    }
    

}

