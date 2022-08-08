//
//  ThirtyMonthsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//  Edited by Brianna Boston
//

import UIKit

class ThirtyMonthsViewController:  UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var A2: UIDatePicker!
    @IBOutlet weak var A1: UIDatePicker!
    @IBOutlet weak var P1: UIPickerView!
    @IBOutlet weak var P2: UIPickerView!
    @IBOutlet weak var Q1: UISwitch!
    @IBOutlet weak var Q2: UISwitch!
    @IBOutlet weak var Q3: UISwitch!
    var Providers: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //date placeholder
        let date1 = A1.date
        let date2 = A2.date
        // Providers
        self.P1.delegate = self
        self.P1.dataSource = self
        self.P2.delegate = self
        self.P2.dataSource = self
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
            print("Question 1: \(Q1.isOn)")
        }
        else if sender.tag == 1{
            print("Question 2: \(Q2.isOn)")
        }
        else if sender.tag == 2{
            print("Question 3: \(Q3.isOn)")
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
