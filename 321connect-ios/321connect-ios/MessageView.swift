//
//  MessageView.swift
//  321connect-ios
//
//  Created by Bri Boston on 6/23/22.
//


import CoreData
import UIKit

class MessageViewController: UIViewController {
    @IBOutlet weak var NotesField: UITextView!
    var messageArray = [Message]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func SaveButton(_ sender: UIButton) {
        
            let new_message = Message(context: self.context)
            new_message.message_Block = NotesField.text
            
            self.messageArray.append(new_message)
            
            
            self.SaveItems()
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LINK: ")
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        loadItems()
       
    }
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
