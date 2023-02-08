//
//  ProfilesViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/2/22.
//

import Foundation
import UIKit
import CoreData

class ProfileType {
    var profile: String?
//    var name: [String]?
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
        
         receivedString = user
       
        print("PRofiles Passed:",receivedString)
        // Do any additional setup after loading the view, typically from a nib.
        
        // ******************************** hard code for debug ********************************
//            profileType.append(ProfileType.init(profile: "Children", name: ChildName))
//            profileType.append(ProfileType.init(profile: "Parents/Caregivers", name: ParentName))
//            profileType.append(ProfileType.init(profile: "Providers", name: ProviderName))
        // ******************************** hard code for debug ********************************

        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(tableViewEditButtonTapped))
        navigationItem.rightBarButtonItem = editButton
        
       
        

 
    }
    
 //#######################################
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadItems()
                    profileType.append(ProfileType.init(profile: "Children", name: ChildName))
                    profileType.append(ProfileType.init(profile: "Parents/Caregivers", name: ParentName))
                    profileType.append(ProfileType.init(profile: "Providers", name: ProviderName))
        context.refreshAllObjects()
        
        self.profilesTableView.reloadData()
//        loadItems()
        

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
//        loadItems()
        
    }
 //#######################################
    //PASSING DATA
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
   
    
   
//#######################################
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        delegate?.getItems(selected_Child)
    }
//#######################################
    func loadItems(){
        
        let request : NSFetchRequest<Child> = Child.fetchRequest()
        let parentrequest : NSFetchRequest<Parent> = Parent.fetchRequest()
        let providerrequest: NSFetchRequest<ProviderE> = ProviderE.fetchRequest()
        request.predicate = NSPredicate(format: "(username MATCHES [cd] %@)", receivedString )
        parentrequest.predicate = NSPredicate(format: "(userName MATCHES [cd] %@)", receivedString )
        providerrequest.predicate  = NSPredicate(format: "(username MATCHES [cd] %@)", receivedString )
        let parent = (try? context.fetch(parentrequest))!
        let childrequest = (try? context.fetch(request))!
        
        let providers = (try? context.fetch(providerrequest))!
        for names in childrequest {
            ChildName.append(names.firstName!)
            print("names in child array: ", names.firstName!)
        }
        for parents in parent{
            ParentName.append(parents.firstName!)
        }
        for prov in providers{
            ProviderName.append(prov.providerName!)
        }

        do{
            ChildArray = try context.fetch(request)
            ParentArray = try context.fetch(parentrequest)
            providerarray = try context.fetch(providerrequest)
            
        } catch{
            print("Error fetching data \(error)")
        }
        
    }
    
      func SaveItems(){
          do {
              try context.save()
              
          } catch {
              print("Error Saving context \(error)")
          }
          self.profilesTableView.reloadData()
          
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
//extension ProfilesViewController: UINavigationControllerDelegate {
//    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        (viewController as? HomeScreenViewController)?.childuser = childss// Here you pass the to your original view controller
//    }
//}

extension ProfilesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // # 3 sections
        return 3
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //bri added this
        tableView.rowHeight = 45;
        return profileType[section].name?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            //Access the array that you have used to fill the tableViewCell
            if indexPath.section == 0 {
                selected_Child.append(ChildName[indexPath.row])
                print("CHILD SELECTED:",selected_Child)

                let alert = UIAlertController(title: "Child Selected", message: "\(selected_Child) is now the current child", preferredStyle: .alert)
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
                let provider_request = NSFetchRequest<NSFetchRequestResult>(entityName: "Provider")
                
                 request.predicate = NSPredicate(format:"username = %@ AND firstName = %@", receivedString,childsname!)
                parent_request.predicate = NSPredicate(format:"userName = %@ AND firstName = %@", receivedString,childsname!)
                provider_request.predicate = NSPredicate(format:"username = %@ AND providerName = %@", receivedString,childsname!)
                    request.fetchLimit = 1
                    parent_request.fetchLimit = 1
                    provider_request.fetchLimit = 1
                
               
//                    let plink = (try? context.fetch(parent_request))?.first
                    
                
//                self.profileType[indexPath.section].name?.remove(at: indexPath.row)
                // Remove row from table view
                self.profilesTableView.deleteRows(at: [indexPath], with: .automatic)
                // Reload table view contents after update
                
                self.profilesTableView.reloadData()
                self.profilesTableView.endUpdates()
                let link = (try? context.fetch(request))?.first
                let link2 = (try? context.fetch(parent_request))?.first
                let link3 = (try? context.fetch(provider_request))?.first
                //This does a check between two entities in the database Parent and CHild
//                if link == nil{
//                    let link = (try? context.fetch(parent_request))?.first
//                    context.delete(link as! NSManagedObject)
//                }
//                {
//                    context.delete(link as! NSManagedObject)
//                }
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
   
    
}
    
