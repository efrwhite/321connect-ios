//
//  DiaperViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//


import Foundation
import UIKit

class DiaperViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    @IBOutlet weak var DiaperNotes: UITextView!
    @IBOutlet weak var DiaperLeakSwitch: UISegmentedControl!
    @IBOutlet weak var AirAccidentSwitch: UISegmentedControl!
    @IBOutlet weak var DiaperCreamSwitch: UISegmentedControl!
    @IBOutlet weak var UnitPicker: UIPickerView!
    @IBOutlet weak var QuantityField: UITextField!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        self.UnitPicker.delegate = self
        self.UnitPicker.dataSource = self
        pickerData = ["mililiters","ounces"]
    }

    @IBAction func Switch(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            //print("Yes")
            
        }
        else if sender.selectedSegmentIndex == 1{
            //print("no")
            
        }
    }

    @IBAction func SaveButton(_ sender: Any) {
        
        let diaperNotes = DiaperNotes.text
        let quantity = QuantityField.text

        // This needs to be put in a if else statement
        let diaperleakswitch_Yes = DiaperLeakSwitch.selectedSegmentIndex
        let AirAccidentSwitch_Yes = AirAccidentSwitch.selectedSegmentIndex
        let DiaperCreamSwitch_Yes = DiaperCreamSwitch.selectedSegmentIndex
      
        print("This is Diaper Notes: \(diaperNotes)")
        print("This is Quantity: \(quantity)")
        print("Diaper leak: \(diaperleakswitch_Yes), AirAccident: \(AirAccidentSwitch_Yes), DiaperCream: \(DiaperCreamSwitch_Yes)")
        
        
    }
    
    
    
    
    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return pickerData[row]
       }
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
      }
   
    

 }
