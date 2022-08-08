//
//  SixMonthsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//// Edited By Brianna Boston

import UIKit

class SixMonthsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var Appointment_One: UIDatePicker!
    @IBOutlet weak var Appointment_two: UIDatePicker!
    @IBOutlet weak var Appointment_three: UIDatePicker!
    
    @IBOutlet weak var Provider_one: UIPickerView!
    @IBOutlet weak var Provider_two: UIPickerView!
    @IBOutlet weak var Provider_three: UIPickerView!
    @IBOutlet weak var Question_One: UISwitch!
    @IBOutlet weak var Question_Two: UISwitch!
    @IBOutlet weak var Question_Three: UISwitch!
    @IBOutlet weak var Question_Five: UISwitch!
    @IBOutlet weak var Question_Four: UISwitch!
    @IBOutlet weak var Question_Six: UISwitch!
    var Providers: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Provider Delagate and Datasource for each Picker
        self.Provider_one.delegate = self
        self.Provider_one.dataSource = self
        self.Provider_two.delegate = self
        self.Provider_two.dataSource = self
        self.Provider_three.delegate = self
        self.Provider_three.dataSource = self
        
        //Placeholder area for dates
        let date1 = Appointment_One.date
        let date2 = Appointment_two.date
        let date3 = Appointment_three.date
        
        Providers = ["Pediatrician",
                   "OT",
                   "PT",
                   "Speech",
                   "Hearing",
                   "Dental",
                   "Cardio",
                   "Ophthalmology"]
    }
    

    /*
    // MARK: - Navigation

    */
    @IBAction func SwitchChangeButton(_ sender: UISwitch) {
        if sender.tag == 0{
            print("Question 1: \(Question_One.isOn)")
        }
        else if sender.tag == 1{
            print("Question 2: \(Question_Two.isOn)")
        }
        else if sender.tag == 2{
            print("Question 3: \(Question_Three.isOn)")
        }
        else if sender.tag == 3{
            print("Question 4: \(Question_Four.isOn)")
        }
        else if sender.tag == 4{
            print("Question 5: \(Question_Five.isOn)")
        }
        else if sender.tag == 5{
            print("Question 6: \(Question_Six.isOn)")
        }
    }
    
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
