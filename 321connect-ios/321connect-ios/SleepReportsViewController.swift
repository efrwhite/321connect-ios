//
//  SleepReportsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/1/22.
//

import UIKit
import CoreData
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
    var SleepArray = [Sleep]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dateFormatter = DateFormatter()
    
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
//        let notesText = sleepNotesView.text!
        let sleepDate = dateTimePicker.date
        dateFormatter.dateFormat = "MM/dd/YY"
        let stringsleepDate = dateFormatter.string(from:sleepDate)
//        let s = String(describing: durationPicker.countDownDuration)
//        print(s)
//
//
//        if (snoreSwitch.isOn == true) {
//            let snoreHistory = "YES"
//        } else {
//            let snoreHistory = "NO"
//        }

        // ********** print to console ****************
//        print("SLEEP DATE: \(sleepDate)")
//        print("SLEEP TIME: \(sleepTime)")
//        print("NOTES: \(notesText)")
//        print("SNORE HISTORY: \(snoreHistory)")
        // ********** print to console ****************
        let new_sleep = Sleep(context: self.context)
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
        self.SleepArray.append(new_sleep)
        self.SaveItems()
        print("THIS IS SLEEP ARRAY", SleepArray)

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
        print(SleepArray)
        } catch{
            print("Error fetching data \(error)")
        }
    }

}
