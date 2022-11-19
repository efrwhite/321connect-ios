//
//  DoctorVisitViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
// Edited By Brianna Boston
//

import UIKit

class DoctorVisitViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var DateOfVisit: UIDatePicker!
    @IBOutlet weak var Provider: UIPickerView!
    @IBOutlet weak var ProviderType: UIPickerView!
    @IBOutlet weak var SysTime: UILabel!
    @IBOutlet weak var WeightUnits: UIButton!
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var HCUnits: UIButton!
    @IBOutlet weak var HeadCirc: UITextField!
    @IBOutlet weak var TempUnits: UIButton!
    @IBOutlet weak var Temp: UITextField!
    @IBOutlet weak var YearOfVisit: UIPickerView!
    @IBOutlet weak var HeightUnits: UIButton!
    var Providers: [String] = [String]()
    var Visits: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let datestring = formatter.string(from: date)

        setPopUpButton()
        
        //Provider
        self.ProviderType.delegate = self
        self.ProviderType.dataSource = self
        Providers = ["Pediatrician",
                   "OT",
                   "PT",
                   "Speech",
                   "Hearing",
                   "Dental",
                   "Cardio",
                   "Ophthalmology"]
        
        
        self.YearOfVisit.delegate = self
        self.YearOfVisit.dataSource = self
        Visits = [  "Newborn",
                    "Two months",
                    "Four months",
                    "Six months",
                    "Nine months",
                    "Twelve months",
                    "Fifteen months",
                    "Eighteen months",
                    "Two years",
                    "Thirty months",
                    "Three years",
                    "Four years",
                    "Five years",
                    "Six years",
                    "Seven years",
                    "Eight years",
                    "Nine years",
                    "Ten years",
                    "Eleven years",
                    "Twelve years",
                    "Not an age-scheduled visit"]
    }
    

    /*
    // MARK: - Navigation
    */
    func setPopUpButton(){
        
        let optional = {(action: UIAction) in print(action.title)}
        //Height
        HeightUnits.menu = UIMenu(children:[
            UIAction(title:"Centimeters (cm)",state: .on, handler: optional),
                UIAction(title:"Feet (ft)", handler: optional)
        ])
        HeightUnits.showsMenuAsPrimaryAction = true
        HeightUnits.changesSelectionAsPrimaryAction = true
        //Weight
        WeightUnits.menu = UIMenu(children:[
            UIAction(title:"Ounces (oz)",state: .on, handler: optional),
                UIAction(title:"Pounds (lbs)", handler: optional)
        ])
       WeightUnits.showsMenuAsPrimaryAction = true
        WeightUnits.changesSelectionAsPrimaryAction = true
        
        // Head Circumference Units
        HCUnits.menu = UIMenu(children:[
            UIAction(title:"Centimeters (cm)",state: .on, handler: optional),
                UIAction(title:"Inches (in)", handler: optional)
        ])
        HCUnits.showsMenuAsPrimaryAction = true
        HCUnits.changesSelectionAsPrimaryAction = true
        
        //Temp
        TempUnits.menu = UIMenu(children:[
            UIAction(title:"Celsius °C",state: .on, handler: optional),
                UIAction(title:"Fahrenheit °F", handler: optional)
        ])
        TempUnits.showsMenuAsPrimaryAction = true
        TempUnits.changesSelectionAsPrimaryAction = true
    }

    @IBAction func SaveButton(_ sender: Any) {
        let Height = Height.text
        let Weight = Weight.text
        let HC = HeadCirc.text
        let Temp = Temp.text
        print("Height:\(Height), Weight \(Weight), Head Circumference \(HC), Tempature \(Temp)")
    }
    
    
    //Provider/Visit Scroller
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
               return Providers.count
        }
        else if pickerView.tag == 2 {
            return Visits.count
        }
        else{
            return Providers.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == ProviderType{
            return Providers[row]
        }
        else if pickerView == YearOfVisit{
            return Visits[row]
        }
         return ""
       }
 

    
    
    
}
