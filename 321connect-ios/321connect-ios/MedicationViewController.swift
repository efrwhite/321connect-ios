//
//  MedicationViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//  Modified By Brianna Boston 1/14/23

import UIKit

class MedicationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
  
    var medicationlist:[String] = ["testing cell"]
    var medication = ""
    @IBOutlet weak var MedicationList: UITableView!
    @IBOutlet weak var labelMeds: UILabel!
    
     override func viewDidLoad() {
        super.viewDidLoad()
        MedicationList.delegate = self
        MedicationList.dataSource = self
        labelMeds.text = "Medication Added:\(medication)"
        medicationlist.append(medication)

    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "MedicationAddition" {
//                let secondViewController = segue.destination as! MedicationAddition
//                secondViewController.delegate = self
//            }
//        }

//        func userDidEnterInformation(info: String) {
//            labelMeds.text = info
//            print("This is my label:",labelMeds.text!)
//        }
    
    
    
    
    
 // Tapped Button
    @IBAction func add_Medication(_ sender: Any) {
    }
   
    //TABLE VIEW CODE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return medicationlist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = medicationlist[indexPath.row]
        return cell
    }
    func loadData() {
        // code to load data from network, and refresh the interface
        MedicationList.reloadData()
    }
    
}

