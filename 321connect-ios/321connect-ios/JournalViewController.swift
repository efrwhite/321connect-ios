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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        notesTextView.layer.cornerRadius = 10
        notesTextView.clipsToBounds = true
        notesTextView.layer.borderWidth = 1
        notesTextView.layer.borderColor = UIColor.black.cgColor
        
        /* * * * dynamic label current time/date * * * */
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
            timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }
   
    /*
     // MARK: - Help Functions
     */
    @objc func tick() {
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
    }
    /* *** source: https://www.youtube.com/watch?v=9UovPNh4Csw *** */
    
    @IBAction func saveTapped(_ sender: Any) {
//        let journalTitle = titleTextField.text!
//        let journalNotes = notesTextView.text!
        
//        // print to console
//        print("TITLE: \(journalTitle)")
//        print("NOTES: \(journalNotes)")
        
        let new_journalEntry = Journal(context: self.context)
        new_journalEntry.title = titleTextField.text!
        new_journalEntry.notes = notesTextView.text!
        
        self.journalArray.append(new_journalEntry)
        
        
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
        let request : NSFetchRequest<Journal> = Journal.fetchRequest()
        do{
        journalArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
    
}
