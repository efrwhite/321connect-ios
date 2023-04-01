//
//  ActivityViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//Brianna Boston

import Foundation
import UIKit
import CoreData
class ActivityViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var activityselection: UIButton!
    @IBOutlet weak var ActivityDuration: UIDatePicker!
    @IBOutlet weak var Note: UITextView!
    
    var ActivityArray = [Activity]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var receivedString = ""
    var user = ""
    var userchild = ""
    
    @IBOutlet weak var CurrentDates: UIDatePicker!
    let dateFormatter = DateFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setpopupbutton()
        receivedString = user
        Note.layer.cornerRadius = 10
        Note.clipsToBounds = true
        Note.layer.borderWidth = 1
        Note.layer.borderColor = UIColor.black.cgColor
        print("Activity Passed:", receivedString, "and Child: ", userchild)
        
        // Gesture to collapse/dismiss keyboard on click outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    @IBAction func SaveButton(_ sender: Any) {
//        let notes = Note.text
//        let activity = activityselection.currentTitle
//        let ActivityDuration = ActivityDuration.countDownDuration
        let sleepDate = CurrentDates.date
        dateFormatter.dateFormat = "MM/dd/YY"
        let stringsleepDate = dateFormatter.string(from:sleepDate)
        
        let new_activity = Activity(context: self.context)
        new_activity.username = receivedString
        new_activity.childName = userchild //defualt child
        new_activity.currentdate = stringsleepDate
        new_activity.duration = ActivityDuration.countDownDuration
        new_activity.notes = Note.text
        new_activity.activityType = activityselection.currentTitle
        new_activity.units = "seconds"
        self.ActivityArray.append(new_activity)
        self.SaveItems()
        
        let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(OKAction)
        present(alert, animated: true)
    }
    
    func setpopupbutton(){
        let optional = {(action: UIAction) in print(action.title)}

        activityselection.menu = UIMenu(children:[
            UIAction(title:"Playing Alone",state: .on, handler: optional),
            UIAction(title:"Playing with Others", handler: optional),
            UIAction(title:"Crawling", handler: optional),
            UIAction(title:"Rolling Over", handler: optional),
            UIAction(title:"Sitting", handler: optional),
            UIAction(title:"Standing", handler: optional),
            UIAction(title:"Out for a walk", handler: optional),
            UIAction(title:"Listening to a story", handler: optional),
            UIAction(title:"Having a bath", handler: optional),
            UIAction(title:"Brushing Teeth", handler: optional),
            UIAction(title:"Other", handler: optional)
        ])
        activityselection.showsMenuAsPrimaryAction = true
        activityselection.changesSelectionAsPrimaryAction = true
        
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
        let request : NSFetchRequest<Activity> = Activity.fetchRequest()
        do{
        ActivityArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
    
}


