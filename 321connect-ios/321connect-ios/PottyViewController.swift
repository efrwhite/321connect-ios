//
//  PottyViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//

import Foundation
import UIKit
import CoreData

class PottyViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var PottyNotes: UITextView!
    @IBOutlet weak var Accident: UISwitch!
    @IBOutlet weak var PottyDuration: UIDatePicker!
    var PottyArray = [Bathroom]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        PottyDuration.countDownDuration
        
        PottyNotes.layer.cornerRadius = 10
        PottyNotes.clipsToBounds = true
        PottyNotes.layer.borderWidth = 1
        PottyNotes.layer.borderColor = UIColor.black.cgColor
        
        // Gesture to collapse/dismiss keyboard on click outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    // Enter dismisses keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // dismiss Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
   
 
    @IBAction func SwitchChange(_ sender: UISwitch) {
        if sender.tag == 0{
            if Accident.isOn {
                print("Accident : Yes")
            }
            else{
                print("Accident: No")
            }
    }
    
    }
    @IBAction func SaveButton(_ sender: Any) {
//        let duration_potty  = PottyDuration.countDownDuration
//        let Notes_Potty = PottyNotes.text
//
//        print("Duration:\(duration_potty), Notes: \(Notes_Potty)")
        let new_potty = Bathroom(context: self.context)
        new_potty.bathroomType = "Potty"
        new_potty.duration = PottyDuration.countDownDuration
        new_potty.bathroomNotes = PottyNotes.text
        new_potty.pottyAccident = Accident.isOn // made it a boolean value since it is on or off
        new_potty.duration = PottyDuration.countDownDuration
        new_potty.units = "seconds"
        self.PottyArray.append(new_potty)
    
        self.SaveItems()
        
        let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(OKAction)
        present(alert, animated: true)
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
            PottyArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}

