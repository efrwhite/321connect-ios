//
//  BehaviorViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/24/22.
//

import Foundation
import UIKit
import CoreData

class BehaviorViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var DateBehaviour: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    var BehaviorArray = [Behavior]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //    @IBOutlet weak var moodDropButton: UIButton!
    //    @IBOutlet weak var moodTableView: UITableView!
    
    @IBOutlet weak var moodButton: UIButton!
    @IBOutlet weak var durationPicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var historyButton: UIButton! // need history
    var receivedString = ""
    var user = ""
    var userchild = ""
    /* mood selection options */
    var moods = ["Happy",
                 "Smiling",
                 "Laughing",
                 "Playful",
                 "Cooling",
                 "Fussy",
                 "Staring",
                 "Curious",
                 "Sad",
                 "Crying",
                 "Sleepy"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setMoodButton()
        
        notesTextView.layer.cornerRadius = 10
        notesTextView.clipsToBounds = true
        notesTextView.layer.borderWidth = 1
        notesTextView.layer.borderColor = UIColor.black.cgColor
        receivedString = user
        print("Behavior Passed Data:", receivedString,"and Child: ", userchild)
        
        // Gesture to collapse/dismiss keyboard on click outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Button Functions
    func setMoodButton() {
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }
        
        moodButton.menu = UIMenu(children : [
            UIAction(title : "Happy", state : .on, handler: optionClosure),
            UIAction(title : "Smiling", handler: optionClosure),
            UIAction(title : "Laughing", handler: optionClosure),
            UIAction(title : "Playful", handler: optionClosure),
            UIAction(title : "Fussy", handler: optionClosure),
            UIAction(title : "Staring", handler: optionClosure),
            UIAction(title : "Curious", handler: optionClosure),
            UIAction(title : "Sad", handler: optionClosure),
            UIAction(title : "Crying", handler: optionClosure),
            UIAction(title : "Sleepy", handler: optionClosure)])
        
        moodButton.showsMenuAsPrimaryAction = true
        moodButton.changesSelectionAsPrimaryAction = true
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        let new_mood = Behavior(context: self.context)
//        let notesText = notesTextView.text!
//        let moodType = moodButton.title(for: .normal)!
//        let duration = durationPicker.countDownDuration
        new_mood.childName = userchild
        new_mood.username = receivedString
        new_mood.notes = notesTextView.text
        new_mood.currentdate = DateBehaviour.date
        // new_mood.time = duration.countDownDuration
        new_mood.moodType = moodButton.currentTitle
        new_mood.time = durationPicker.countDownDuration
        new_mood.unit = "seconds"
//        new_mood.units = durationPicker.minuteInterval
      
        // ********** print to console ****************
//        print("NOTES: \(notesText)")
//        print("MOOD: \(moodType)")    // fix for required selection?
//        print("DURATION: \(duration)")
        self.BehaviorArray.append(new_mood)
        self.SaveItems()
        
        let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(OKAction)
        present(alert, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "behaviorHistorySegue" {
            let historyVC = segue.destination as! HistoryTableViewController
            
            // Pass data to the history view controller here
            historyVC.title = "Behavior History"
            historyVC.user = receivedString
            historyVC.userchild = userchild
            historyVC.segueType = segue.identifier 
        }
        if segue.identifier == "BehaviorSegue1"{
            let homeVC = segue.destination as! HomeScreenViewController
            homeVC.child = userchild
            
        }
    }
    
    // Enter dismisses keyboard
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            // dismiss the keyboard
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    // dismiss Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        let request : NSFetchRequest<Behavior> = Behavior.fetchRequest()
        do{
        BehaviorArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}
    


