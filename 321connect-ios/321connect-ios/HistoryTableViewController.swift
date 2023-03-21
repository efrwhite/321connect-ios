//
//  HistoryTableViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/26/22.
//

import UIKit
import CoreData

class HistoryTableViewController: UITableViewController {
    var segueType: String?
    var receivedString = ""
    var user = ""
    var userchild = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var BehaviorArray = [Behavior]()
    var JournalArray = [Journal]()
    var MessageArray = [Message]()
    var History_Date = [String]()
    var History_text = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // set background for table view
        tableView.backgroundView = UIImageView(image: UIImage(named: "Rectangle 99"))
        tableView.backgroundColor = .clear
        receivedString = user
        print("Behavior Passed Data:", receivedString,"and Child: ", userchild)
        loadItems()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return History_text.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if segueType == "behaviorHistorySegue" {
            cell.detailTextLabel?.text = History_text[indexPath.row]
            cell.textLabel?.text = History_Date[indexPath.row]
        }
                  
        if segueType == "journalHistorySegue" {
            cell.detailTextLabel?.text = History_text[indexPath.row]
            cell.textLabel?.text = History_Date[indexPath.row]
        }
//        if segueType == "messageHistorySegue" {
//            cell.detailTextLabel?.text = History_text[indexPath.row]
//            cell.textLabel?.text = History_Date[indexPath.row]
//        }
       // return cell
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        
        
        if segueType == "journalHistorySegue"{
            let request : NSFetchRequest<Journal> = Journal.fetchRequest()
            do{
                JournalArray = try context.fetch(request)
                request.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, userchild )
                let journalhistory = (try? context.fetch(request))!
                for j in journalhistory {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // set the date format
                    let date = j.currentdate! // replace this with your own date object
                    let dateString = dateFormatter.string(from: date) // convert the date to a string
                    
                    History_Date.append(dateString)
                    History_text.append(j.notes!)
                    print("History values:", j.currentdate!,"AND",j.notes!)
                }
            }
            catch{
                print("Error fetching data \(error)")
            }
        }
//        else if segueType == "messageHistorySegue" {
//            let request : NSFetchRequest<Message> = Message.fetchRequest()
//            do{
//                MessageArray = try context.fetch(request)
//                request.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, userchild )
//                let messagehistory = (try? context.fetch(request))!
//                for m in messagehistory {
//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // set the date format
//                    let date = m.currentdate! // replace this with your own date object
//                    let dateString = dateFormatter.string(from: date) // convert the date to a string
//
//                    History_Date.append(dateString)
//                    History_text.append(b.notes!)
//                    print("History values:", b.currentdate!,"AND",b.notes!)
//                }
//            }
//            catch{
//                print("Error fetching data \(error)")
//            }
//
//        }
        else if segueType == "behaviorHistorySegue"{
            let request : NSFetchRequest<Behavior> = Behavior.fetchRequest()
            do{
                BehaviorArray = try context.fetch(request)
                request.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, userchild )
                let behaviourhistory = (try? context.fetch(request))!
                for b in behaviourhistory {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // set the date format
                    let date = b.currentdate! // replace this with your own date object
                    let dateString = dateFormatter.string(from: date) // convert the date to a string
                    
                    History_Date.append(dateString) //array called History_date  appends the date from database
                    History_text.append(b.notes!)
                    print("History values:", b.currentdate!,"AND",b.notes!)
                }
            } catch{
                print("Error fetching data \(error)")
            }
        }
        else if segueType == "messageHistorySegue"{
            
        }
        
    }
}


