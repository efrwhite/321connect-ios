// March 1 push
//  ProfilesViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/2/22.
//  Edited by Brianna Boston in March 2023

import Foundation
import UIKit
import CoreData

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
   
    var delegate: getItemsDelegate?
    var receivedString = ""
    var user = ""
    var selected_Child2 = ""
    var selected_Edit : String? = ""
    var isEditButtonPressed = false
    var profileType = [ProfileType]()
    var ChildName = [String]()
    var ParentName = [String]()
    var ChildArray = [Child]()
    var ProviderName = [String]()
    var ParentArray = [Parent]()
    var providerarray = [ProviderE]()
    var selected_Child = [String]()
    var childss = "Shippo"
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
 
    
   //######################################
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadItems()
//        reloadInputViews()
    //######################################
        receivedString = user
        print("PRofiles Passed:",receivedString)
        // Do any additional setup after loading the view, typically from a nib.
        profilesTableView.delegate = self
         profilesTableView.dataSource = self
        loadItems()
     
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(tableViewEditButtonTapped))
        navigationItem.rightBarButtonItem = editButton
        
       
        DispatchQueue.main.async {
            // Update your table view or cells here
            self.profilesTableView.reloadData()
        }

 
    }
    
 //#######################################
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profilesTableView.reloadData()
        loadItems()
 
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

        
    }
 //#######################################
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isEditButtonPressed {
            if (segue.identifier == "showChildVC"){
                let displayVC = segue.destination as! ChildView
                displayVC.user = receivedString
                if selected_Edit != nil{
                    displayVC.edit = selected_Edit!
                }
            }
            if(segue.identifier == "showParentsVC"){
                let displayVC = segue.destination as! Parent_Caregiver_ViewController
                displayVC.user = receivedString
                if selected_Edit != nil{
                    displayVC.edit = selected_Edit!
                }
            }
            if(segue.identifier == "showProvidersVC"){
                let displayVC = segue.destination as! ProvidersViewController
                displayVC.user = receivedString
                if selected_Edit != nil{
                    displayVC.edit = selected_Edit!
                }
            }
        } else {
            if (segue.identifier == "showChildVC"){
                let displayVC = segue.destination as! ChildView
                displayVC.user = receivedString
            }
            if(segue.identifier == "showParentsVC"){
                let displayVC = segue.destination as! Parent_Caregiver_ViewController
                displayVC.user = receivedString
            }
            if(segue.identifier == "showProvidersVC"){
                let displayVC = segue.destination as! ProvidersViewController
                displayVC.user = receivedString
            }
        }
    }
    
//#######################################
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        
        delegate?.getItems(selected_Child)
        profilesTableView.reloadInputViews()
    }
//#######################################
    func loadItems(){
        // Fetch child data
        let childRequest : NSFetchRequest<Child> = Child.fetchRequest()
        childRequest.predicate = NSPredicate(format: "(username MATCHES [cd] %@)", receivedString )
        let childArray = try? context.fetch(childRequest)
        let childNames = childArray?.compactMap({ $0.firstName })
        
        // Fetch parent data
        let parentRequest : NSFetchRequest<Parent> = Parent.fetchRequest()
        parentRequest.predicate = NSPredicate(format: "(userName MATCHES [cd] %@)", receivedString )
        let parentArray = try? context.fetch(parentRequest)
        let parentNames = parentArray?.compactMap({ $0.firstName })
        
        // Fetch provider data
        let providerRequest : NSFetchRequest<ProviderE> = ProviderE.fetchRequest()
        providerRequest.predicate  = NSPredicate(format: "(username MATCHES [cd] %@)", receivedString )
        let providerArray = try? context.fetch(providerRequest)
        let providerNames = providerArray?.compactMap({ $0.providerName })
        
        // Create ProfileType objects using the fetched data
        var profileTypes: [ProfileType] = []
        if let childNames = childNames, !childNames.isEmpty {
            profileTypes.append(ProfileType(profile: "Children", name: childNames))
        }
        else {
            // Create an empty section for "Providers"
            profileTypes.append(ProfileType(profile: "Children", name: []))
        }
        if let parentNames = parentNames, !parentNames.isEmpty {
            profileTypes.append(ProfileType(profile: "Parents/Caregivers", name: parentNames))
        }else {
            // Create an empty section for "Providers"
            profileTypes.append(ProfileType(profile: "Parents/Caregivers", name: []))
        }
        if let providerNames = providerNames, !providerNames.isEmpty {
            profileTypes.append(ProfileType(profile: "Providers", name: providerNames))
        } else {
            // Create an empty section for "Providers"
            profileTypes.append(ProfileType(profile: "Providers", name: []))
        }
        
        // Set the profileType array to the created ProfileType objects
        self.profileType = profileTypes
        
        // Reload the table view data on the main thread
        DispatchQueue.main.async {
            self.profilesTableView.reloadData()
        }
    }

      func SaveItems(){
          do {
              try context.save()
              // Call reloadData() on the main thread
                     DispatchQueue.main.async {
                         self.profilesTableView.reloadData()
                     }
          } catch {
              print("Error Saving context \(error)")
          }
          
      }
    
   

}


extension ProfilesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // # 3 sections
        return 3
    }
   //index out of range error here
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return self.profileType[section].name?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let selectedRow = indexPath.row
            let selectedsection = indexPath.section
            print("Selected row: \(selectedRow)")
            let selectedProfileType = profileType[selectedsection].name
            let selected_child = selectedProfileType![selectedRow]
            selected_Child.append(selected_child)
            let selectChild = selected_Child.last!
            let alert = UIAlertController(title: "Child Selected", message: "\(selectChild) is now the current child", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            // Optional: display an alert to notify the user that only the first section can be selected
            let alert = UIAlertController(title: "Invalid Selection", message: "Please select a child from the list", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
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
            let yesAction = UIAlertAction(title: "Delete", style: .default) { [self] _ in
                
                // Delete item from data source
                self.profilesTableView.beginUpdates()
                
                let childsname = profileType[indexPath.section].name?.remove(at: indexPath.row)
                print("Area choosen for deletion:",childsname!)
                //CORE DATA DELETION SECTION
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Child")
                let parent_request = NSFetchRequest<NSFetchRequestResult>(entityName: "Parent")
                let provider_request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProviderE")
                
                 request.predicate = NSPredicate(format:"username = %@ AND firstName = %@", receivedString,childsname!)
                parent_request.predicate = NSPredicate(format:"userName = %@ AND firstName = %@", receivedString,childsname!)
                provider_request.predicate = NSPredicate(format:"username = %@ AND providerName = %@", receivedString,childsname!)
                    request.fetchLimit = 1
                    parent_request.fetchLimit = 1
                    provider_request.fetchLimit = 1
                
               

                
//                self.profileType[indexPath.section].name?.remove(at: indexPath.row)
                // Remove row from table view
                self.profilesTableView.deleteRows(at: [indexPath], with: .automatic)
                
                // Reload table view contents after update
                self.profilesTableView.reloadData()
                self.profilesTableView.endUpdates()
                let link = (try? context.fetch(request))?.first
                let link2 = (try? context.fetch(parent_request))?.first
                let link3 = (try? context.fetch(provider_request))?.first
//                print("LINK 1:", link!, " Link 2:", link2!, "Link 3:", link3!)

                
                
                if (link != nil){
                    context.delete(link as! NSManagedObject)
                    
                }
                if(link2 != nil){
                    context.delete(link2 as! NSManagedObject)
                    
                }
                if (link3 != nil) {
                    context.delete(link3 as! NSManagedObject)
                
                }
               
                SaveItems()

                
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
    
    @objc func editButtonPressed(sender: UIButton) {
        print("edit button pressed")
        isEditButtonPressed = true
        // Get the index path of the button that was pressed
          let buttonPosition = sender.convert(CGPoint.zero, to: self.profilesTableView)
          guard let indexPath = self.profilesTableView.indexPathForRow(at: buttonPosition) else { return }
        let sectionIndex = indexPath.section
        let rowIndex = indexPath.row
        print("Selected Section: \(indexPath)")
        print("Selected Sender Tag: \(sectionIndex)")
        
        if let selectedProfileType = profileType[sectionIndex].name {
               let selectedString = selectedProfileType[rowIndex]
               print("Selected ProfileType: \(selectedProfileType)")
               print("Selected string: \(selectedString)")
               selected_Edit = selectedString

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
        isEditButtonPressed = true
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
        selected_Edit = nil
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
    
    
    
    @objc func tableViewEditButtonTapped(_ sender: UIButton) {
//        profilesTableView.isEditing = !profilesTableView.isEditing

        // Get the section of the pressed button
        let section = sender.tag

        // Get the row of the pressed button by finding the cell that contains the button
        if let cell = sender.superview?.superview as? CustomTableViewCell,
           let indexPath = profilesTableView.indexPath(for: cell) {

            // Check if the selected section is the first section
            if section == 0 {
                let selectedProfileType = profileType[section].name
                let selectedChild = selectedProfileType?[indexPath.row]
                print("Edit button pressed for: \(selectedChild ?? "")")
            }
        }

    }
//    @objc func tableViewEditButtonTapped(_ sender: UIButton) {
//        // Check if the sender button is in the header view
//        if let headerView = sender.superview as? ProfileHeaderView {
//            // Perform segue without sending any data
//            switch headerView.profileTitle.text {
//            case "Children":
//                self.performSegue(withIdentifier: "showChildVC", sender: nil)
//            case "Parents":
//                self.performSegue(withIdentifier: "showParentsVC", sender: nil)
//            case "Providers":
//                self.performSegue(withIdentifier: "showProvidersVC", sender: nil)
//            default:
//                break
//            }
//        } else {
//            // Get the section and row of the pressed button
//            if let cell = sender.superview?.superview as? CustomTableViewCell,
//               let indexPath = profilesTableView.indexPath(for: cell),
//               let selectedProfileType = profileType[indexPath.section].name {
//                let selectedData = selectedProfileType[indexPath.row]
//                // Perform segue while passing the selected data to the next view controller
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                if let editProfileVC = storyboard.instantiateViewController(withIdentifier: "EditProfileViewController") as? EditProfileViewController {
//                    editProfileVC.selectedData = selectedData
//                    self.navigationController?.pushViewController(editProfileVC, animated: true)
//                }
//            }
//        }
//    }


    
    // MARK: - Navigation
   
    
}
    
