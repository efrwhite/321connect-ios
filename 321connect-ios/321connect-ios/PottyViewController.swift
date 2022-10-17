//
//  PottyViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//

import Foundation
import UIKit
import CoreData

class PottyViewController: UIViewController {
    
    @IBOutlet weak var PottyNotes: UITextView!
    @IBOutlet weak var Accident: UISwitch!
    @IBOutlet weak var PottyDuration: UIDatePicker!
    var PottyArray = [Bathroom]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
//        PottyDuration.countDownDuration
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
        
        self.PottyArray.append(new_potty)
        self.SaveItems()
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

