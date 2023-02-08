//
//  MedicationAddition.swift
//  321connect-ios
//
//  Created by Bri Boston on 1/17/23.
//


import Foundation
import CoreData
import UIKit
 //protocol used for sending data back
//protocol DataEnteredDelegate: class {
//    func userDidEnterInformation(info: String)
//}
class MedicationAddition: UIViewController {
    
//    weak var delegate: DataEnteredDelegate? = nil
    
    @IBOutlet weak var MedicationName: UITextField!
    
    @IBOutlet weak var DosageAmount: UITextField!
    
    @IBOutlet weak var DosageUnits: UIButton!
    
    @IBOutlet weak var Frequency: UITextField!
    
    @IBOutlet weak var MedicationReason: UITextField!
    var userchild = ""
    var medicationArray = [Medication]()
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load units button with drop down values
        setUnitsButton()
        
    }
    
    // MARK: Button functions
    
    func setUnitsButton() {
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }
        
        DosageUnits.menu = UIMenu(children : [
            UIAction(title : "grams (g)", state : .on, handler: optionClosure),
            UIAction(title : "milligrams (mg)", handler: optionClosure),
            UIAction(title : "ounces (oz)", handler: optionClosure),
            UIAction(title : "cups", handler: optionClosure),
            UIAction(title : "teaspoon (tsp)", handler: optionClosure),
            UIAction(title : "tablespoon (tbsp)", handler: optionClosure)])
        
        DosageUnits.showsMenuAsPrimaryAction = true
        DosageUnits.changesSelectionAsPrimaryAction = true
    }
    
    @IBAction func AddMedication(_ sender: Any) {
        let new_medication = Medication(context: self.context)
        new_medication.medName = MedicationName.text!
        new_medication.medDosage = DosageAmount.text!
        new_medication.medDosageUnits = DosageUnits.currentTitle
        new_medication.medFrequency = Frequency.text!
        new_medication.medReason = MedicationReason.text!
        
        self.medicationArray.append(new_medication)
        self.SaveItems()
        
//        // Call this method on whichever class implements our delegate protocol
//        delegate?.userDidEnterInformation(info: MedicationName.text!)
//
//
//                // Go back to the previous view controller
//        _ = self.navigationController?.popViewController(animated: true)
//
    }
    
    // MARK: Database functions
    
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }


    func loadItems(){
        let request : NSFetchRequest<Medication> = Medication.fetchRequest()
        do{
            medicationArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}


