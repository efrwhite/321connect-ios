//
//  HistoryTableViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/26/22.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    var segueType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // set background for table view
        tableView.backgroundView = UIImageView(image: UIImage(named: "Rectangle 99"))
        tableView.backgroundColor = .clear


    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if segueType == "journalHistorySegue" {
            cell.textLabel?.text = "04/22/23 4:55PM"
            cell.detailTextLabel?.text = "Dear Journal, this is a journal entry"
        } else if segueType == "behaviorHistorySegue" {
            cell.textLabel?.text = "09/12/22 9:15AM"
            cell.detailTextLabel?.text = "This is a behavior entry example. Jody was happy"
        } else if segueType == "messageHistorySegue" {
            cell.textLabel?.text = "11/01/22 1:30PM"
            cell.detailTextLabel?.text = "This is an example of a message history row."
        }
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

}
