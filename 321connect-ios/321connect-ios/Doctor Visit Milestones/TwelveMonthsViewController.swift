//
//  TwelveMonthsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//// Edited By Brianna Boston

import UIKit

class TwelveMonthsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    //Switch Questions
    @IBOutlet weak var Question_ten: UISwitch!
    @IBOutlet weak var Question_nine: UISwitch!
    @IBOutlet weak var Question_Eight: UISwitch!
    @IBOutlet weak var Question_Seven: UISwitch!
    @IBOutlet weak var Question_six: UISwitch!
    @IBOutlet weak var Question_Fivew: UISwitch!
    @IBOutlet weak var Question_four: UISwitch!
    @IBOutlet weak var Question_Three: UISwitch!
    @IBOutlet weak var Question_Two: UISwitch!
    @IBOutlet weak var Question_One: UISwitch!
    
    //Provider
    @IBOutlet weak var Provider_Five: UIPickerView!
    @IBOutlet weak var Provider_Four: UIPickerView!
    @IBOutlet weak var Provider_Three: UIPickerView!
    @IBOutlet weak var Provider_Two: UIPickerView!
    @IBOutlet weak var Provider_one: UIPickerView!
    var Providers: [String] = [String]()
    //Appointment Dates
    @IBOutlet weak var Appointment_Five: UIDatePicker!
    @IBOutlet weak var Appointment_Four: UIDatePicker!
    @IBOutlet weak var Appointment_Three: UIDatePicker!
    @IBOutlet weak var Appointment_Two: UIDatePicker!
    @IBOutlet weak var Appointment_One: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Provider Picker
        self.Provider_one.delegate = self
        self.Provider_one.dataSource = self
        self.Provider_Two.delegate = self
        self.Provider_Two.dataSource = self
        self.Provider_Three.delegate = self
        self.Provider_Three.dataSource = self
        self.Provider_Four.delegate = self
        self.Provider_Four.dataSource = self
        self.Provider_Five.delegate = self
        self.Provider_Five.dataSource = self
        
        Providers = ["Pediatrician",
                   "OT",
                   "PT",
                   "Speech",
                   "Hearing",
                   "Dental",
                   "Cardio",
                   "Ophthalmology"]
        
        //Dates PlaceHolder area
        let date1 = Appointment_One.date
        let date2 = Appointment_Two.date
        let date3 = Appointment_Three.date
        let date4 = Appointment_Four.date
        let date5 = Appointment_Five.date
        
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
            print("Question 4: \(Question_four.isOn)")
        }
        else if sender.tag == 4{
            print("Question 5: \(Question_Fivew.isOn)")
        }
        else if sender.tag == 5{
            print("Question 6: \(Question_six.isOn)")
        }
        else if sender.tag == 6{
            print("Question 7: \(Question_Seven.isOn)")
        }
        else if sender.tag == 7{
            print("Question 8: \(Question_Eight.isOn)")
        }
        else if sender.tag == 8{
            print("Question 9: \(Question_nine.isOn)")
        }
        else if sender.tag == 9{
            print("Question 10: \(Question_ten.isOn)")
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
