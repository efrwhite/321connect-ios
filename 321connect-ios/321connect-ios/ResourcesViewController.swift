//
//  ResourcesViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/3/22.
//

import UIKit
import WebKit

class ResourcesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sections = ["National Support Groups", "Your Resources"]
    var resources = [
        ["National Down Syndrome Congress",
         "National Down Syndrome Society",
         "Down Syndrome Diagnosis Network"],
        []
    ]
    
    var links = [
         "http://www.ndsccenter.org",
         "http://www.ndss.org",
         "http://wwwdsdiagnosisnetwork.org"
    ]
    
    @IBOutlet weak var ResourcesTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ResourcesTableView.delegate = self
        ResourcesTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return self.sections[section]
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.sections.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return resources[section].count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = resources[indexPath.section][indexPath.row]
//        return cell
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showLinks" {
//            if let indexPath = ResourcesTableView.indexPathForSelectedRow {
//                let destination = segue.destination as? ResourcesViewController
//                destination?.links = links[indexPath.row]
//            }
//        }
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resources[section].count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = resources[indexPath.section][indexPath.row]

        return cell
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLinks" {
            if let indexPath = ResourcesTableView.indexPathForSelectedRow {
                let destination = segue.destination as? ResourcesViewController
                destination?.links = links[indexPath.row]
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
