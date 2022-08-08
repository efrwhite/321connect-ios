//
//  FourYearsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//// Edited By Brianna Boston

import UIKit

class FourYearsViewController:  UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var Q7: UISwitch!
    @IBOutlet weak var Q6: UISwitch!
    @IBOutlet weak var Q5: UISwitch!
    @IBOutlet weak var Q4: UISwitch!
    @IBOutlet weak var q3: UISwitch!
    @IBOutlet weak var q2: UISwitch!
    @IBOutlet weak var Q1: UISwitch!
    @IBOutlet weak var P5: UIPickerView!
    @IBOutlet weak var P4: UIPickerView!
    @IBOutlet weak var P3: UIPickerView!
    @IBOutlet weak var P2: UIPickerView!
    @IBOutlet weak var P1: UIPickerView!
    @IBOutlet weak var A5: UIDatePicker!
    @IBOutlet weak var A4: UIDatePicker!
    @IBOutlet weak var A3: UIDatePicker!
    @IBOutlet weak var A2: UIDatePicker!
    @IBOutlet weak var A1: UIDatePicker!
    var Providers: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Providers
        self.P1.delegate = self
        self.P1.dataSource = self
        self.P2.delegate = self
        self.P2.dataSource = self
        self.P3.delegate = self
        self.P3.dataSource = self
        self.P4.delegate = self
        self.P4.dataSource = self
        self.P5.delegate = self
        self.P5.dataSource = self
        Providers = ["Pediatrician",
                   "OT",
                   "PT",
                   "Speech",
                   "Hearing",
                   "Dental",
                   "Cardio",
                   "Ophthalmology"]

        // Date PlaceHolder
        let date1 = A1.date
        let date2 = A2.date
        let date3 = A3.date
        let date4 = A4.date
        let date5 = A5.date
    }
    @IBAction func SwitchChangeButton(_ sender: UISwitch) {
        if sender.tag == 0{
            print("Question 1: \(Q1.isOn)")
        }
        else if sender.tag == 1{
            print("Question 2: \(q2.isOn)")
        }
        else if sender.tag == 2{
            print("Question 3: \(q3.isOn)")
        }
        else if sender.tag == 3{
            print("Question 3: \(Q4.isOn)")
        }
        else if sender.tag == 4{
            print("Question 3: \(Q5.isOn)")
        }
        else if sender.tag == 5{
            print("Question 3: \(Q6.isOn)")
        }
        else if sender.tag == 6{
            print("Question 3: \(Q7.isOn)")
        }
       
    }


    /*
    // MARK: - Navigation
    */
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
