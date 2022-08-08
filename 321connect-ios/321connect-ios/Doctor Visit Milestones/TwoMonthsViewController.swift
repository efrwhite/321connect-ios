//
//  TwoMonthsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
// Edited By Brianna Boston

import UIKit

class TwoMonthsViewController:  UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var Provider_one: UIPickerView!
    @IBOutlet weak var appointment_one: UIDatePicker!
    @IBOutlet weak var question_nine: UISwitch!
    @IBOutlet weak var question_eight: UISwitch!
    @IBOutlet weak var question_seven: UISwitch!
    @IBOutlet weak var question_Six: UISwitch!
    @IBOutlet weak var question_Five: UISwitch!
    @IBOutlet weak var Question_Four: UISwitch!
    @IBOutlet weak var Question_Three: UISwitch!
    @IBOutlet weak var Question_Two: UISwitch!
    @IBOutlet weak var Question_One: UISwitch!
    var Providers: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Provider_one.delegate = self
        self.Provider_one.dataSource = self
        Providers = ["Pediatrician",
                   "OT",
                   "PT",
                   "Speech",
                   "Hearing",
                   "Dental",
                   "Cardio",
                   "Ophthalmology"]
        let date = appointment_one.date
        print(date)
        // this is a placeholder for now in date
    }
    
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
            print("Question 5: \(question_Five.isOn)")
        }
        else if sender.tag == 5{
            print("Question 6: \(question_Six.isOn)")
        }
        else if sender.tag == 6{
            print("Question 7: \(question_seven.isOn)")
        }
        else if sender.tag == 7{
            print("Question 8: \(question_eight.isOn)")
        }
        else if sender.tag == 8{
            print("Question 9: \(question_nine.isOn)")
        }
        
    }
    
    /*
    // MARK: - Look into date

    }
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
