//
//  ViewController.swift
//  Practice_DV
//
//  Created by Bri Boston on 8/7/22.
//

//
//  NewbornViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//  Edited by Brianna Boston on 8/5/22
//

import UIKit

class NewbornViewController:  UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var Provider_Picker: UIPickerView!
    @IBOutlet weak var Provider_Two: UIPickerView!
    @IBOutlet weak var Picker_Three: UIPickerView!
    @IBOutlet weak var Provider_Four: UIPickerView!
    @IBOutlet weak var Provider_Five: UIPickerView!
    @IBOutlet weak var appointment_Date: UIDatePicker!
    @IBOutlet weak var appointment_Date_Two: UIDatePicker!
    @IBOutlet weak var appointment_Three: UIDatePicker!
    @IBOutlet weak var appointment_Four: UIDatePicker!
    @IBOutlet weak var AppointMent_Five: UIDatePicker!
    
    @IBOutlet weak var Question_Eleven: UISwitch!
    @IBOutlet weak var Question_Ten: UISwitch!
    @IBOutlet weak var Question_nine: UISwitch!
    @IBOutlet weak var Question_Eight: UISwitch!
    @IBOutlet weak var Question_Seven: UISwitch!
    @IBOutlet weak var Question_Six: UISwitch!
    @IBOutlet weak var Question_Four: UISwitch!
    @IBOutlet weak var Question_Three: UISwitch!
    @IBOutlet weak var Question_two: UISwitch!
    @IBOutlet weak var Question_one: UISwitch!
    var Providers: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Provider_Picker.delegate = self
        self.Provider_Picker.dataSource = self
        self.Provider_Two.delegate = self
        self.Provider_Two.dataSource = self
        self.Picker_Three.delegate = self
        self.Picker_Three.dataSource = self
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

       
    }
   
    @IBAction func SwitchChanged(_ sender: UISwitch) {
        if sender.tag == 0{
            print("Question 1: \(Question_one.isOn)")
        }
        else if sender.tag == 1{
            print("Question 2: \(Question_two.isOn)")
        }
        else if sender.tag == 2{
            print("Question 3: \(Question_Three.isOn)")
        }
        else if sender.tag == 3{
            print("Question 4: \(Question_Four.isOn)")
        }
        else if sender.tag == 4{
            print("Question 5: \(Question_Six.isOn)")
        }
        else if sender.tag == 5{
            print("Question 6: \(Question_Seven.isOn)")
        }
        else if sender.tag == 6{
            print("Question 7: \(Question_Eight.isOn)")
        }
        else if sender.tag == 7{
            print("Question 8: \(Question_nine.isOn)")
        }
        else if sender.tag == 8{
            print("Question 9: \(Question_Ten.isOn)")
        }
        else if sender.tag == 9{
            print("Question 10: \(Question_Eleven.isOn)")
        }
    }
    
   
    @IBAction func SAVEBUTTON(_ sender: Any) {
        let date_time = appointment_Date.date
        let date_time2 = appointment_Date_Two.date
        let date_time3 = appointment_Three.date
        let date_time4 = appointment_Four.date
        let date_time5 = AppointMent_Five.date


        print("Appointment Date 1: \(date_time)")
        print("Appointment Date 2: \(date_time2)")
        print("Appointment Date 3: \(date_time3)")
        print("Appointment Date 4: \(date_time4)")
       print("Appointment Date 5: \(date_time5)")
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

