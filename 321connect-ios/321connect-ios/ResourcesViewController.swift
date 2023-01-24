//
//  ResourcesViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/3/22.
//

import UIKit
import WebKit
import CoreData

class ResourcesTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        
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
    /*Table view arrays data part 2 of links*/
    var userLinks = [
        "http://www.google.com",
        "https://www.desertmuseum.org/"
        ]
    
    @IBOutlet weak var resourceAddButton: UIButton!
    var resourceArray = [Resource]()
     // Where Locations = your NSManaged Class

 

   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set background for table view
        tableView.backgroundView = UIImageView(image: UIImage(named: "Rectangle 99"))
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        loadItems()

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
        
        let confirmAction = UIAlertAction(title: "Add", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            
            // Check if text fields are left blank
            if let resource = alertController.textFields?[0].text, let urlPath = alertController.textFields?[1].text {
                if resource.isEmpty || urlPath.isEmpty {
                    
                    // display error message
                    let errorAlert = UIAlertController(title: "Error", message: "Please enter a resource title and URL", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    errorAlert.addAction(okAction)
                    self.present(errorAlert, animated: true, completion: nil)
                    return
                }
                print("Resource Title: \(resource)")
                print("Resource URL: \(urlPath)")
                //DataBase Entry
//                self.userResources.append(resource!)
//                self.userLinks.append(urlPath!)
                let new_resource = Resource(context: self.context)
                new_resource.resourceTitle = resource
                new_resource.resourcelink = urlPath
                self.resourceArray.append(new_resource)
                self.SaveItems()
                
                // include in array data source
                self.add(resource, urlPath)
//                self.add(resource ?? "Default", urlPath!)           /* here might need to fix for input error checking */
            }
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
//            /* Else use custom resource cell */
//            let cell = tableView.dequeueReusableCell(withIdentifier: "userResourceCell", for: indexPath) as! UserResourceCell
//            /* user resource cells change title label */
//            cell.resourceTitleLabel.text = userResources[indexPath.row]
//            return cell
            /* Else use custom resource cell */
            let cell = tableView.dequeueReusableCell(withIdentifier: "userResourceCell", for: indexPath)
            /* user resource cells change title label */
            cell.textLabel?.text = userResources[indexPath.row]
            return cell
        }
        
        
        
    }
    
    // disable editing for section 0: Support Groups
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        } else {
            return true
        }
    }
    //DELETETION

    // tableview editing styles
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let usertask = userResources[indexPath.row]
            let usertaskl = userLinks[indexPath.row]
            print("Deletion ")
            print(type(of: usertask),usertask)
            print(type(of: usertaskl),usertaskl)
            
            //Deleting from Database
            print("TESTING AREA FOR MY DELETION")
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Resource")
            request.predicate = NSPredicate(format:"resourcelink = %@ AND resourceTitle = %@", usertaskl,usertask)
            request.fetchLimit = 1
            print(request)
            let link = (try? context.fetch(request))?.first
            
          
            // delete row from data source(s)
            userResources.remove(at: indexPath.row)
            userLinks.remove(at: indexPath.row)
            
            
            // delete row from tableview
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
            context.delete(link as! NSManagedObject)
            SaveItems()
            
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
    
    // Database Methods
    func SaveItems(){
       
        do {
            try context.save()
            
        } catch {
            print("Error Saving context \(error)")
        }
        self.tableView.reloadData()
        
    }
    
    func loadItems(){
        
        let request : NSFetchRequest<Resource> = Resource.fetchRequest()
      
        resourceArray = (try? context.fetch(request))!
         
        for location in resourceArray {
            userResources.append(location.resourceTitle!)
            userLinks.append(location.resourcelink!)
        }

        do{
            resourceArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }

}
