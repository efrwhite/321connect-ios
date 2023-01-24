//
//  ProfilesViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/2/22.
//

import Foundation
import UIKit

class ProfileType {
    var profile: String?
    var name: [String]?
    
    init(profile: String, name: [String]){
        self.profile = profile
        self.name = name
    }
}

class ProfilesViewController: UIViewController {
    
    @IBOutlet weak var profilesTableView: UITableView!
    
    var profileType = [ProfileType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // ******************************** hard code for debug ********************************
        profileType.append(ProfileType.init(profile: "Children", name: ["Edward", "Dallas"]))
        profileType.append(ProfileType.init(profile: "Parents/Caregivers", name: ["Jackson", "Charlotte"]))
        profileType.append(ProfileType.init(profile: "Providers", name: ["Brianna"]))
        // ******************************** hard code for debug ********************************
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(tableViewEditButtonTapped))
        navigationItem.rightBarButtonItem = editButton


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
//    @IBAction func editTapped(_ sender: Any, indexPath: IndexPath) {
//        // Get the index path of the cell that contains the button
//        let button = sender as! UIButton
//        let section = indexPath.section
//
//        // Use a switch statement to determine the corresponding view controller based on the section of the index path
//        switch section {
//            case 0:
//                self.performSegue(withIdentifier: "showChildVC", sender: button)
//            case 1:
//                self.performSegue(withIdentifier: "showParentsVC", sender: button)
//            case 2:
//                self.performSegue(withIdentifier: "showProvidersVC", sender: button)
//            default:
//                break
//        }
//    }
}
    
extension ProfilesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // # 3 sections
        return 3
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return profileType[section].name?.count ?? 0
        
    }
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /* Deletion editing style w/ alert */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // alert user for deletion confirmation
            let alert = UIAlertController(title: "Delete profile?", message: "This profile will be deleted from this account. This action cannot be undone. ", preferredStyle: .alert)
            
            // confirm delete
            let yesAction = UIAlertAction(title: "Delete", style: .default) { _ in
                
                // Delete item from data source
                self.profilesTableView.beginUpdates()
                self.profileType[indexPath.section].name?.remove(at: indexPath.row)
                
                // Remove row from table view
                self.profilesTableView.deleteRows(at: [indexPath], with: .automatic)
                
                // Reload table view contents after update
                self.profilesTableView.reloadData()
                self.profilesTableView.endUpdates()
            }
            
            // dismiss deletion
            let noAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true, completion: nil)
        }
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = profilesTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
            // assign profile name to row
            cell.nameLabel.text = profileType[indexPath.section].name?[indexPath.row]
        
            // Set the allowsSelection property of the cells in the sections [2,3] to false
                if indexPath.section == 0 {
                    cell.selectionStyle = .default
                } else {
                    cell.selectionStyle = .none
                }
        
            // edit button (need passed data from db)
            cell.editButton.tag = indexPath.section
            cell.editButton.addTarget(self, action: #selector(editButtonPressed(sender:)), for: .touchUpInside)

            return cell
        }
    
    @objc
    func editButtonPressed(sender:UIButton) {
        print("add button pressed")
        let sectionIndex:Int = sender.tag
        switch sectionIndex {
        case 0:
            self.performSegue(withIdentifier: "showChildVC", sender: editButtonItem)
        case 1:
            self.performSegue(withIdentifier: "showParentsVC", sender: editButtonItem)
        case 2:
            self.performSegue(withIdentifier: "showProvidersVC", sender: editButtonItem)
        default:
            break
        }
    }

    /* HEADER VIEWS AND TITLES */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return profileType[section].profile
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // show custom Profile Header View (with add button)
        let headerView = Bundle.main.loadNibNamed("ProfileHeaderView", owner: self, options: nil)?.first as! ProfileHeaderView
        
        headerView.profileAddButton.tag = section
        
        headerView.profileAddButton.addTarget(self, action: #selector(profileAddButtonPressed(sender:)), for: .touchUpInside)
        
        headerView.profileTitle.text = profileType[section].profile
        
        return headerView
    }
    
    @objc
    func profileAddButtonPressed(sender:UIButton) {

        let sectionIndex:Int = sender.tag
        switch sectionIndex {
        case 0:
            self.performSegue(withIdentifier: "showChildVC", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "showParentsVC", sender: nil)
        case 2:
            self.performSegue(withIdentifier: "showProvidersVC", sender: nil)
        default:
            break
        }
    }
    
    @objc func tableViewEditButtonTapped(_ sender: Any) {
        profilesTableView.isEditing = !profilesTableView.isEditing
    }

    
    // MARK: - Navigation
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
    
