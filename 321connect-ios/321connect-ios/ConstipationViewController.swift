//
//  ConstipationViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//

import Foundation
import UIKit
import CoreData

class ConstipationViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var ConstiNotes: UITextView!
    @IBOutlet weak var DoLSConsti: UIDatePicker!
    @IBOutlet weak var TreatPlan: UITextField!
    var ConstipationArray = [Bathroom]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConstiNotes.layer.cornerRadius = 10
        ConstiNotes.clipsToBounds = true
        ConstiNotes.layer.borderWidth = 1
        ConstiNotes.layer.borderColor = UIColor.black.cgColor
        
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
            ConstipationArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}

