//
//  TwelveYearsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//// Edited By Brianna Boston

import UIKit

class TwelveYearsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet weak var A1: UIDatePicker!
    @IBOutlet weak var A2: UIDatePicker!
    @IBOutlet weak var Q1: UISwitch!
    @IBOutlet weak var P1: UIPickerView!
    @IBOutlet weak var P2: UIPickerView!
    var Providers: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Date
        let date1 = A1.date
        let date2 = A2.date
        //Provider
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
    
    @IBAction func SwitchChangeButton(_ sender: UISwitch) {
       
            print("Question 1: \(Q1.isOn)")
      
       
    }

    /*
    // MARK: - Navigation

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
