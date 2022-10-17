//
//  ConstipationViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//

import Foundation
import UIKit
import CoreData

class ConstipationViewController: UIViewController {
    @IBOutlet weak var ConstiNotes: UITextView!
    @IBOutlet weak var DoLSConsti: UIDatePicker!
    @IBOutlet weak var TreatPlan: UITextField!
    var ConstipationArray = [Bathroom]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
   

    @IBAction func ConstiSaveButton(_ sender: Any) {
//        let ConstipationDate = DoLSConsti.date
//        let notes = ConstiNotes.text
//        let TreatmentPlan = TreatPlan.text
//        print("Notes: \(notes),Consipation Date:\(ConstipationDate)  Treatment\(TreatmentPlan)")
        let new_constipation = Bathroom(context: self.context)
        new_constipation.bathroomType = "Constipation"
        new_constipation.dateOfLastStool = DoLSConsti.date
        new_constipation.bathroomNotes = ConstiNotes.text
        new_constipation.treatment = TreatPlan.text
        
        self.ConstipationArray.append(new_constipation)
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
            ConstipationArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}

