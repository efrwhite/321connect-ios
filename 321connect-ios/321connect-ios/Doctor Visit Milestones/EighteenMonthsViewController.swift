//
//  EighteenMonthsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//// Edited By Brianna Boston

import UIKit

class EighteenMonthsViewController:  UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var Q_1: UISwitch!
    @IBOutlet weak var Q_2: UISwitch!
    @IBOutlet weak var Q_3: UISwitch!
    @IBOutlet weak var Q_4: UISwitch!
    @IBOutlet weak var Appoint_One: UIDatePicker!
    @IBOutlet weak var Appoint_Two: UIDatePicker!
    
    @IBOutlet weak var Provider_two: UIPickerView!
    @IBOutlet weak var Provider_One: UIPickerView!
    var Providers: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Providers
        self.Provider_One.delegate = self
        self.Provider_One.dataSource = self
        self.Provider_two.delegate = self
        self.Provider_two.dataSource = self
        Providers = ["Pediatrician",
                   "OT",
                   "PT",
                   "Speech",
                   "Hearing",
                   "Dental",
                   "Cardio",
                   "Ophthalmology"]
        
        // Placeholder for Date
        let date1 = Appoint_One.date
        let date2 = Appoint_Two.date
    }
    

    /*
    // MARK: - Navigation

    */
    @IBAction func SwitchChangeButton(_ sender: UISwitch) {
        if sender.tag == 0{
            print("Question 1: \(Q_1.isOn)")
        }
        else if sender.tag == 1{
            print("Question 2: \(Q_2.isOn)")
        }
        else if sender.tag == 2{
            print("Question 3: \(Q_3.isOn)")
        }
        else if sender.tag == 3{
            print("Question 4: \(Q_4.isOn)")
        }
    }
    
    // Picker for Providers
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
