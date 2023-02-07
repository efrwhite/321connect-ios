//
//  MessageView.swift
//  321connect-ios
//
//  Created by Bri Boston on 6/23/22.
//


import CoreData
import UIKit

class MessageViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var NotesField: UITextView!
    var messageArray = [Message]()
    var timer = Timer()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NotesField.layer.cornerRadius = 10
        NotesField.clipsToBounds = true
        NotesField.layer.borderWidth = 1
        NotesField.layer.borderColor = UIColor.black.cgColor
        
        /* * * * dynamic label current time/date * * * */
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
            timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        
        print("LINK: ")
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        loadItems()
    }
    
    
    // MARK: - Help Functions * * * * * * * * * * * * * * * * * * * *
    @objc func tick() {
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
    }
    /* *** source: https://www.youtube.com/watch?v=9UovPNh4Csw *** */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "messageHistorySegue" {
            let historyVC = segue.destination as! HistoryTableViewController
            
            // Pass data to the history view controller here <--
            historyVC.title = "Activity History"
            historyVC.segueType = segue.identifier
        }
    }
    
    @IBAction func SaveButton(_ sender: UIButton) {
        if NotesField.text!.isEmpty{
            let alert = UIAlertController(title: "Error", message: "Please complete all text fields", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(OKAction)
            present(alert, animated: true)
            
        } else{
            
            let new_message = Message(context: self.context)
            new_message.message_Block = NotesField.text
            
            self.messageArray.append(new_message)
            self.SaveItems()
            
            let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(OKAction)
            present(alert, animated: true)
        }
    }
    
    // MARK: - Database Functions * * * * * * * * * * * * * * * * * * * *
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
    }

    func loadItems(){
        let request : NSFetchRequest<Message> = Message.fetchRequest()
        do{
        messageArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}
