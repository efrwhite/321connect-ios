//
//  TwoYearsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//// Edited By Brianna Boston

import UIKit

class TwoYearsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var Q1: UISwitch!
    @IBOutlet weak var Q2: UISwitch!
    @IBOutlet weak var Q3: UISwitch!
    @IBOutlet weak var Q4: UISwitch!
    @IBOutlet weak var Q5: UISwitch!
    @IBOutlet weak var Q6: UISwitch!
    @IBOutlet weak var Q7: UISwitch!
    @IBOutlet weak var Q8: UISwitch!
    @IBOutlet weak var Q9: UISwitch!
    
    @IBOutlet weak var Appoint1: UIDatePicker!
    @IBOutlet weak var Appoint2: UIDatePicker!
    @IBOutlet weak var Appoint3: UIDatePicker!
    @IBOutlet weak var Appoint4: UIDatePicker!
    
    @IBOutlet weak var P1: UIPickerView!
    @IBOutlet weak var P2: UIPickerView!
    @IBOutlet weak var P3: UIPickerView!
    @IBOutlet weak var P4: UIPickerView!
    var Providers: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.P1.delegate = self
        self.P1.dataSource = self
        self.P2.delegate = self
        self.P2.dataSource = self
        self.P3.delegate = self
        self.P3.dataSource = self
        self.P4.delegate = self
        self.P4.dataSource = self
        Providers = ["Pediatrician",
                   "OT",
                   "PT",
                   "Speech",
                   "Hearing",
                   "Dental",
                   "Cardio",
                   "Ophthalmology"]
        // Placeholder for date
        let date1 = Appoint1.date
        let date2 = Appoint2.date
        let date3 = Appoint3.date
        let date4 = Appoint4.date
    }
    

    /*
    // MARK: - Navigation
    }
    */
    @IBAction func SwitchChangeButton(_ sender: UISwitch) {
        if sender.tag == 0{
            print("Question 1: \(Q1.isOn)")
        }
        else if sender.tag == 1{
            print("Question 2: \(Q2.isOn)")
        }
        else if sender.tag == 2{
            print("Question 3: \(Q3.isOn)")
        }
        else if sender.tag == 3{
            print("Question 4: \(Q4.isOn)")
        }
        else if sender.tag == 4{
            print("Question 5: \(Q5.isOn)")
        }
        else if sender.tag == 5{
            print("Question 6: \(Q6.isOn)")
        }
        else if sender.tag == 6{
            print("Question 7: \(Q7.isOn)")
        }
        else if sender.tag == 7{
            print("Question 8: \(Q8.isOn)")
        }
        else if sender.tag == 8{
            print("Question 9: \(Q9.isOn)")
        }
        
    }
    
    // Providers
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
               return Providers.count
        }
//        else if pickerView.tag == 1 {
//               return Providers.count
//           }
        else {
            return Providers.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return Providers[row]
       }
}
