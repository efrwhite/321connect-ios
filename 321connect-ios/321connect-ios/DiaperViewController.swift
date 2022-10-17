//
//  DiaperViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//


import Foundation
import UIKit
import CoreData

class DiaperViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    @IBOutlet weak var DiaperNotes: UITextView!
    @IBOutlet weak var QuantityField: UITextField!
    @IBOutlet weak var DiaperLeak: UISwitch!
    @IBOutlet weak var DiaperCream: UISwitch!
    @IBOutlet weak var Accident: UISwitch!
    @IBOutlet weak var QuantityUnits: UIButton!
    var DiaperArray = [Bathroom]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
       setPopUpButton()

    }

    

    @IBAction func SwitchCheck(_ sender: UISwitch) {
        if sender.tag == 0{
            print("Diaper leak: \(DiaperLeak.isOn)")
        }
        if sender.tag == 1{
            print("Open Air Accident: \(Accident.isOn)")
        }
        if sender.tag == 2{
            print("Diaper Cream: \(DiaperCream.isOn)")
        }
        
        
    }
    @IBAction func SaveButton(_ sender: Any) {
      
//        let diaperNotes = DiaperNotes.text
//        let quantity = QuantityField.text
//        print("This is Diaper Notes: \(diaperNotes)")
//        print("This is Quantity: \(quantity)")
        let new_Diaper = Bathroom(context: self.context)
        new_Diaper.bathroomType = "Diaper"
        new_Diaper.bathroomNotes = DiaperNotes.text
        new_Diaper.diaperCream = DiaperCream.isOn
        new_Diaper.leak = DiaperLeak.isOn
        new_Diaper.openAir = Accident.isOn
        new_Diaper.quantity = QuantityField.text
        new_Diaper.units = QuantityUnits.currentTitle
        
        
        self.DiaperArray.append(new_Diaper)
        self.SaveItems()
       
        
        
    }
    func setPopUpButton(){
        let optional = {(action: UIAction) in print(action.title)}

        QuantityUnits.menu = UIMenu(children:[
            UIAction(title:"Milliliter (mL)",state: .on, handler: optional),
                UIAction(title:"Ounces (oz)", handler: optional)
        ])
        QuantityUnits.showsMenuAsPrimaryAction = true
        QuantityUnits.changesSelectionAsPrimaryAction = true
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
   
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        let request : NSFetchRequest<Bathroom> = Bathroom.fetchRequest()
        do{
            DiaperArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }

 }
