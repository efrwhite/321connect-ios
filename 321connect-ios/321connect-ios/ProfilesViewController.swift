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
        return profileType.count
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return profileType[section].name?.count ?? 0
        
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = profilesTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
            cell.nameLabel.text = profileType[indexPath.section].name?[indexPath.row]
            // Set the allowsSelection property of the cells in the sections [2,3] to false
                if indexPath.section == 0 {
                    cell.selectionStyle = .default
                } else {
                    cell.selectionStyle = .none
                }
            cell.editButton.tag = indexPath.section
            cell.editButton.addTarget(self, action: #selector(editButtonPressed(sender:)), for: .touchUpInside)
            cell.deleteButton.addTarget(self, action: #selector(deleteButtonTapped(sender:)), for: .touchUpInside)
//            cell.deleteClosure = { [weak self] in
//                self?.deleteButtonTapped(sender: cell.deleteButton)
//            }
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
    
    @objc
    func deleteButtonTapped(sender: UIButton) {
        print ("delete tapped")
        guard let cell = sender.superview?.superview as? CustomTableViewCell, let indexPath = profilesTableView.indexPath(for: cell) else { return }
        let alertController = UIAlertController(title: "Delete", message: "Are you sure you want to delete this profile?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
           // Delete the corresponding data from the data source array
           self.profileType.remove(at: indexPath.row)
           // Delete the corresponding row from the table view
           self.profilesTableView.deleteRows(at: [indexPath], with: .fade)
            
            self.profilesTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
           // dismiss the alert
        }
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
//        present(alertController, animated: true, completion: nil)
        self.present(alertController, animated: true, completion: nil)
     }
    
    // MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showChildVC" {
//            let destinationVC = segue.destination as! ChildView
//        } else if segue.identifier == "showParentsVC" {
//            let destinationVC = segue.destination as! Parent_Caregiver_ViewController
//        } else if segue.identifier == "showProvidersVC" {
//            let destinationVC = segue.destination as! ProvidersViewController
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
            // CHILD SELECTION HERE
//        }
        
//        switch indexPath.section {
//        case 0:
//            self.performSegue(withIdentifier: "showChildVC", sender: tableView(_:didSelectRowAt:))
//        case 1:
//            self.performSegue(withIdentifier: "showParentsVC", sender: tableView(_:didSelectRowAt:))
//        case 2:
//            self.performSegue(withIdentifier: "showProvidersVC", sender: tableView(_:didSelectRowAt:))
//        default:
//            break
//        }
    }
}
    
