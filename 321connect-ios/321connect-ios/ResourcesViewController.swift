//
//  ResourcesViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/3/22.
//

import UIKit
import WebKit

class ResourcesTableViewController: UITableViewController {
        
    var sections = ["National Support Groups", "Your Resources"]
    
    var name = [
        ["National Down Syndrome Congress",
         "National Down Syndrome Society",
         "Down Syndrome Diagnosis Network"],
        ["Google",
         "Arizona/Sonora Desert Museum"]
        ]
    var groups = [
        "http://www.ndsccenter.org",
        "http://www.ndss.org",
        "http://www.dsdiagnosisnetwork.org"
        ]
    
    var userLinks = [
        "http://www.google.com",
        "https://www.desertmuseum.org/"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundView = UIImageView(image: UIImage(named: "Rectangle 1"))
        
        navigationItem.rightBarButtonItem = editButtonItem

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
        return name[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* If NSG section, use basic cell */
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = name[indexPath.section][indexPath.row]
            return cell
            
        } else {
            /* Else use custom resource cell */
            let cell = tableView.dequeueReusableCell(withIdentifier: "userResourceCell", for: indexPath) as! UserResourceCell
            /* user resource cells change title label */
            cell.resourceTitleLabel.text = name[indexPath.section][indexPath.row]
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
            name.remove(at: indexPath.row)
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
                destination?.links = groups[indexPath.row]
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
