//
//  childInformationViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/25/22.
// Reminder allergies and medications are comma seperated
//
 
import Foundation
import UIKit
 
class ChildView: UIViewController {
 
    @IBOutlet weak var Birthday: UITextField!
    @IBOutlet weak var DueDate: UITextField!
    
    @IBOutlet weak var OnOff: UISegmentedControl!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Allergies: UITextField!
    @IBOutlet weak var Medications: UITextField!
    
 
    @IBAction func Slider(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            print("Boy")
        }
        else if sender.selectedSegmentIndex == 1{
            print("Girl")
        }
    }
    
    
    private var datePicker: UIDatePicker?
    private var datePicker2: UIDatePicker?
    
    override func viewDidLoad() {
     super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker2 = UIDatePicker()
        
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ChildView.dateChanged(datePicker:)), for: .valueChanged)
        datePicker2?.datePickerMode = .date
        datePicker2?.addTarget(self, action: #selector(ChildView.dateChange(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ChildView.viewTapGesture(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        Birthday.inputView = datePicker
        DueDate.inputView = datePicker2
    }
    @objc func viewTapGesture (gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
   
    @objc func dateChanged(datePicker: UIDatePicker){
        let DateFormatter = DateFormatter()
        DateFormatter.dateFormat = "MM/dd/yyyy"
        Birthday.text = DateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        
    }
    
    @objc func dateChange(datePicker: UIDatePicker){
        let DateFormatter = DateFormatter()
        DateFormatter.dateFormat = "MM/dd/yyyy"
        DueDate.text = DateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        
    }
   
 
    @IBAction func SaveButton(_ sender: UIButton) {
        
        let FN = FirstName.text!
        let LN = LastName.text!
        let DD = DueDate.text!
        let BD = Birthday.text!
        let Al = Allergies.text!
        let MD = Medications.text!
      //  let Sl: () = Slider(OnOff)
        
        
        print("This is the firstName: \(FN)")
        print("This is the firstName: \(LN)")
        print("This is the Birthdate: \(BD)")
        print("This is the DueDate: \(DD)")
       // print("this is the Slider: \(Sl))")
        print("This is the Allergies: \(Al)")
        print("This is the Medications: \(MD)")
      
    }

}
