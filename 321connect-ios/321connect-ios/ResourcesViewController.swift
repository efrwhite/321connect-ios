//
//  ResourcesViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/3/22.
//

import UIKit
import WebKit

class ResourcesTableViewController: UITableViewController {
        
    /* Table view arrays data */
    var sections = ["National Support Groups", "Your Resources"]
    
    /* section 1: National Support Groups */
    var groups = ["National Down Syndrome Congress",
                "National Down Syndrome Society",
                "Down Syndrome Diagnosis Network"]
    
    /* section 2: User Provided Resouces (will change with database) */
    var userResources = ["Google",
                         "Arizona/Sonora Desert Museum"]
    
    /* URL arrays for navigation segues */
    var groupLinks = [
        "http://www.ndsccenter.org",
        "http://www.ndss.org",
        "http://www.dsdiagnosisnetwork.org"
        ]
    
    var userLinks = [
        "http://www.google.com",
        "https://www.desertmuseum.org/"
        ]
    
    @IBOutlet weak var resourceAddButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set background for table view
        tableView.backgroundView = UIImageView(image: UIImage(named: "Rectangle 1"))
        
        navigationItem.rightBarButtonItem = editButtonItem

    }
    
    @IBAction func addTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add A Resource", message: nil, preferredStyle: .alert)
        
        // create resource title text field
        alertController.addTextField(configurationHandler: {(_ textField: UITextField) -> Void in
            textField.placeholder = "Resource Title:"
        })

        // create resource path text field
        alertController.addTextField(configurationHandler: {(_ textField: UITextField) -> Void in
            textField.placeholder = "Resource URL:"
        })

        // Alert action confirm
        let confirmAction = UIAlertAction(title: "Add", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            print("Resource Title: \(String(describing: alertController.textFields?[0].text))")
            let resource = alertController.textFields?[0].text
            print("Resource URL: \(String(describing: alertController.textFields?[1].text))")
            let urlPath = alertController.textFields?[1].text
            
            // include in array data source
            self.add(resource ?? "Default", urlPath!)           /* here might need to fix for input error checking */
        })
        alertController.addAction(confirmAction)

        // Alert action cancel
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            print("Cancelled")
        })
        alertController.addAction(cancelAction)

       // Present alert controller
       present(alertController, animated: true, completion: nil)
    }
    
    func add(_ resource: String,_ urlPath: String) {
        let index = 0
        userResources.insert(contentsOf: [resource], at: index)
        userLinks.insert(contentsOf: [urlPath], at: index)
        
        let resourceIndexPath = IndexPath(row: index, section: 1)
        tableView.insertRows(at: [resourceIndexPath], with: .left)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // # two sections
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.groups.count
        }
        return self.userResources.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* If NSG section, use basic cell */
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = groups[indexPath.row]
            return cell
            
        } else {
            /* Else use custom resource cell */
            let cell = tableView.dequeueReusableCell(withIdentifier: "userResourceCell", for: indexPath) as! UserResourceCell
            /* user resource cells change title label */
            cell.resourceTitleLabel.text = userResources[indexPath.row]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        } else {
            return true
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            // delete row from data source
            userResources.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segue for NSG section basic cells
        if segue.identifier == "showGroups" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destination = segue.destination as? WebViewController
                destination?.links = groupLinks[indexPath.row]
                }
            }
        // segue for Your Resources section custom cells
        else if segue.identifier == "showResources" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destination = segue.destination as? WebViewController
                destination?.links = userLinks[indexPath.row]
            }
        }
    }
}
