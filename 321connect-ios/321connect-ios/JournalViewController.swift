//
//  JournalViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/2/22.
//

import Foundation
import UIKit
import CoreData

class JournalViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    var journalArray = [Journal]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var timer = Timer()
    var receivedString = ""
    var user = ""
    var userchild = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        notesTextView.layer.cornerRadius = 10
        notesTextView.clipsToBounds = true
        notesTextView.layer.borderWidth = 1
        notesTextView.layer.borderColor = UIColor.black.cgColor
        receivedString = user
        print("Journal Passed:", receivedString, "and Child: ", userchild)
        
        /* * * * dynamic label current time/date * * * */
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
            timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        
        // Gesture to collapse/dismiss keyboard on click outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
   
    /*
     // MARK: - Help Functions
     */
    @objc func tick() {
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
        
        /* *** source: https://www.youtube.com/watch?v=9UovPNh4Csw *** */
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
    
    @IBAction func saveTapped(_ sender: Any) {
//        let journalTitle = titleTextField.text!
//        let journalNotes = notesTextView.text!
        
//        // print to console
//        print("TITLE: \(journalTitle)")
//        print("NOTES: \(journalNotes)")
        
//        let new_journalEntry = Journal(context: self.context)
//        new_journalEntry.username = receivedString
//        new_journalEntry.title = titleTextField.text!
//        new_journalEntry.notes = notesTextView.text!
//
//        self.journalArray.append(new_journalEntry)
//
//
//        self.SaveItems()
        
        // here are alerts for success or errors on view at save tapped
        if titleTextField.text!.isEmpty || notesTextView.text.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please complete all fields", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(OKAction)
            present(alert, animated: true)
        } else {
            
            // moved database code here (-edward)
            let new_journalEntry = Journal(context: self.context)
            new_journalEntry.username = receivedString
            new_journalEntry.childName = userchild
            new_journalEntry.title = titleTextField.text!
            new_journalEntry.notes = notesTextView.text!
            
            self.journalArray.append(new_journalEntry)
            
            
            self.SaveItems()
            
            let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(OKAction)
            present(alert, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "journalHistorySegue" {
            let historyVC = segue.destination as! HistoryTableViewController
            
            // Pass data to the history view controller here
            historyVC.title = "Journal History"
            historyVC.segueType = segue.identifier 
        }
    }
    
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
    }

    func loadItems(){
        let request : NSFetchRequest<Journal> = Journal.fetchRequest()
        do{
        journalArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
    
}
