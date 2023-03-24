//
//  HomeScreenViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/11/22.
//

import Foundation
import UIKit
import CoreData

class HomeScreenViewController: UIViewController,getItemsDelegate, UITableViewDataSource, UITableViewDelegate{

    // Recent Entry struct
    struct Entry {
        var date: Date
        var message: String
    }
    
    func getItems(_ items: [String]) {
        childuser = items
        print("ITEMS: ",childuser)
    }
    
    var ChildProfilefirst = [String]()
    var ChildProfilelast = [String]()
    var ChildProfileDate = [Date]()
    var ChildProfileImage = [UIImage]()
    var ChildArray = [Child]()
    var Sleepy = [String]()
    var SleepyDate = [Date]()
    var sleeparray = [Sleep]()
    var BehaviorArray = [Behavior]()
    var JournalArray = [Journal]()
    var entries = [Entry]()
    var journalentries = [Entry]()
    var login_child = ""
    var signup_child = ""
    var defualt_child = ""

    // homescreen(ext) vc local variables
    @IBOutlet weak var feedButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var sleepButton: UIButton!
    @IBOutlet weak var behaviorButton: UIButton!
    @IBOutlet weak var resourcesButton: UIButton!
    @IBOutlet weak var Agelabel: UILabel!
    @IBOutlet weak var medicalButton: UIButton!
    @IBOutlet weak var profilesButton: UIButton!
    @IBOutlet weak var RecentEntryTableView: UITableView!
    @IBOutlet weak var childImage: UIButton!
    @IBOutlet weak var labelISO: UILabel!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var receivedString = ""
    var user = ""
    var childuser = [String]()
    var childname = ""
    var child = ""
    var seguechild = ""
    var receivedChild = ""
    var segueChild = ""
    
    // extension button to return to home screen
    @IBAction func extentionButton(_ sender: Any) {
    }
    
    // automatic segue - unwind
    @IBAction func unwindToHomeScreenExtVC(segue: UIStoryboardSegue) {
        
    }

   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadInputViews()
        entries.removeAll()
        loadItems()
        
        print("Array of SleepDates",SleepyDate)
        print("Array of Sleep:", Sleepy)
        

            let lastElement = childuser.last
            if lastElement != nil{
                let date = Date()
                
                // Create Date Formatter
                let dateFormatter = DateFormatter()
                let calendar = Calendar.current
                
                let year = calendar.component(.year, from: date)
                
                // Set Date Format
                dateFormatter.dateFormat = "YYYY/MM/dd"
                
                // Convert Date to String
                dateFormatter.dateFormat = "YYYY/MM/dd"
                print("CHILD passed:", lastElement!)
                var firstname = String(ChildProfilefirst.last!)
                var lastname = String(ChildProfilelast.last!)
               
                let strfnln = firstname + " " + lastname
                var Dates = ChildProfileDate.first!
                var stringdate = dateFormatter.string(from: Dates)
                let components = stringdate.components(separatedBy: "/")
                var childyear = components.first!
                
                var intchidyear = Int(childyear)
                print("CHILD YEAR",intchidyear)
                var currentyear = Int(year)
                print("CURRENT YEAR",currentyear)
                var diffyear = currentyear - intchidyear!
                var age = String(diffyear)
                self.labelISO.text = strfnln
                self.Agelabel.text = "Age: " + age
                
                print("Image Size:", ChildProfileImage.first?.size)
                print("Image Data: ", ChildProfileImage.first?.pngData())

                if ChildProfileImage.first != nil {
                    childImage.setBackgroundImage(ChildProfileImage.last, for: .normal)
                } else {
                    print("ChildProfileImage is nil.")
                }
                
//            }
        }
        else{
            let date = Date()
            
            // Create Date Formatter
            let dateFormatter = DateFormatter()
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            
            // Set Date Format
            dateFormatter.dateFormat = "YYYY/MM/dd"
            
            // Convert Date to String
            dateFormatter.dateFormat = "YYYY/MM/dd"
//            print("CHILD passed:", lastElement!)
            
            var firstname = String(ChildProfilefirst.first!)
            var lastname = String(ChildProfilelast.first!)
            if firstname != nil && lastname != nil{
                
                let strfnln = firstname + " " + lastname
                var Dates = ChildProfileDate.first!
                var stringdate = dateFormatter.string(from: Dates)
                let components = stringdate.components(separatedBy: "/")
                var childyear = components.first!
                
                var intchidyear = Int(childyear)
                print("CHILD YEAR",intchidyear)
                var currentyear = Int(year)
                print("CURRENT YEAR",currentyear)
                var diffyear = currentyear - intchidyear!
                var age = String(diffyear)
                self.labelISO.text = strfnln
                self.Agelabel.text = "Age: " + age
                
                print("Image Size:", ChildProfileImage.first?.size)
                print("Image Data: ", ChildProfileImage.first?.pngData())
               
                
                if ChildProfileImage.first != nil {
                    childImage.setBackgroundImage(ChildProfileImage.last, for: .normal)
                } else {
                    print("ChildProfileImage is nil.")
                }
            }
            else{
                firstname = "Isoceles"
                lastname = "Lab"
                let strfnln = firstname + " " + lastname
                self.labelISO.text = strfnln
            }
            RecentEntryTableView.reloadData()
            
        }
//        let newlyAddedItems = Array(entries[lastIndex..<entries.count])
//        lastIndex = entries.count
//
//        // Append newly added items to the table view
//        let indexPaths = newlyAddedItems.enumerated().map { (index, _) in
//            IndexPath(row: lastIndex - newlyAddedItems.count + index, section: 0)
//        }
//        tableView.insertRows(at: indexPaths, with: .automatic)
        // reload table view with new data
        RecentEntryTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        print("Home Screen Received Child:", child)
        // profile image mask and style
        childImage.layer.borderWidth = 1.0
        childImage.layer.masksToBounds = false
        childImage.layer.borderColor = UIColor.white.cgColor
        childImage.layer.cornerRadius = childImage.frame.size.width/2
        childImage.clipsToBounds = true
        receivedString = user
        receivedChild = segueChild
        print("HOME SCREEN Passed", receivedString)
        print("Home Screen Received Child:", child)
        print("CHILD PASSED TO HOME:", childuser)
        print("LOGIN CHILD: ", login_child)
       
        // table view styling
        RecentEntryTableView.layer.cornerRadius = 10
        RecentEntryTableView.clipsToBounds = true
        RecentEntryTableView.layer.borderWidth = 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if childuser.last != nil{
            child = childuser.last!
            if (segue.identifier == "HomeScreenViewExt")
            {
                let destViewController = segue.destination as! UINavigationController
                let secondViewcontroller = destViewController.viewControllers.first as! HomeScreenViewControllerExt
                secondViewcontroller.userchild = child
                secondViewcontroller.user = receivedString
            }
            if(segue.identifier == "ResourcesView"){
                let displayVC = segue.destination as! ResourcesTableViewController
                displayVC.userchild = child
                displayVC.user = receivedString
            }
            if(segue.identifier == "FoodSegueHomeScreen1"){
                let displayVC = segue.destination as! FeedViewController
                displayVC.userchild = child
                displayVC.user = receivedString
            }
            if (segue.identifier == "BehaviorSegue1"){
                let displayVC = segue.destination as! BehaviorViewController
                displayVC.userchild = child
                displayVC.user = receivedString
            }
            if (segue.identifier == "SleepViewSegue"){
                let displayVC = segue.destination as! SleepViewController
                displayVC.userchild = child
                displayVC.user = receivedString
            }
            if (segue.identifier == "ActivityViewSegue"){
                let displayVC = segue.destination as! ActivityViewController
                displayVC.userchild = child
                displayVC.user = receivedString
            }
            if (segue.identifier == "ProfilesViewSegue"){
                let vc = segue.destination as! ProfilesViewController
                let displayVC = segue.destination as! ProfilesViewController
                vc.delegate = self
                displayVC.user = receivedString
            }
            if (segue.identifier == "HomeDV"){
                let displayVC = segue.destination as! MedicalViewController
                displayVC.userchild = child
                displayVC.user = receivedString
            }
         }
        
    else{
        if (segue.identifier == "HomeScreenViewExt")
        {
            let destViewController = segue.destination as! UINavigationController
            let secondViewcontroller = destViewController.viewControllers.first as! HomeScreenViewControllerExt
            secondViewcontroller.userchild = ChildProfilefirst.last!
            secondViewcontroller.user = receivedString
        }
        if(segue.identifier == "ResourcesView"){
            let displayVC = segue.destination as! ResourcesTableViewController
            displayVC.userchild = ChildProfilefirst.last!
            displayVC.user = receivedString
        }
        if(segue.identifier == "FoodSegueHomeScreen1"){
            let displayVC = segue.destination as! FeedViewController
            displayVC.userchild = ChildProfilefirst.last!
            displayVC.user = receivedString
        }
        if (segue.identifier == "BehaviorSegue1"){
            let displayVC = segue.destination as! BehaviorViewController
            displayVC.userchild = ChildProfilefirst.last!
            displayVC.user = receivedString
        }
        if (segue.identifier == "SleepViewSegue"){
            let displayVC = segue.destination as! SleepViewController
            displayVC.userchild = ChildProfilefirst.last!
            displayVC.user = receivedString
        }
        if (segue.identifier == "ActivityViewSegue"){
            let displayVC = segue.destination as! ActivityViewController
            displayVC.userchild = ChildProfilefirst.last!
            displayVC.user = receivedString
        }
        if (segue.identifier == "ProfilesViewSegue"){
            let vc = segue.destination as! ProfilesViewController
            let displayVC = segue.destination as! ProfilesViewController
            vc.delegate = self
            displayVC.user = receivedString
        }
        if (segue.identifier == "HomeDV"){
            let displayVC = segue.destination as! MedicalViewController
            displayVC.userchild = ChildProfilefirst.last!
            displayVC.user = receivedString
        }
        
    }
}
    
    // MARK: - UITableView * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = min(entries.count, 10)          /* line of code takes entries from database and gets the
                                                     minimum of amount of entries and 10 (limit table to 10) */
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Sort the entries array by date
        entries = entries.sorted(by: {
            $0.date.compare($1.date) == .orderedDescending
        })
 
        // Convert the date string to a formatted string for row field assignment...
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let date = dateFormatter.string(from: entries[indexPath.row].date)
        
        // Populate tableview with date(String) and message
        cell.textLabel?.text = date
        cell.detailTextLabel?.text = entries[indexPath.row].message
        
        return cell
    }
    
    // MARK: - Database functions * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ *
    func loadItems(){
        
        let request : NSFetchRequest<Child> = Child.fetchRequest() // first request : NSFetchRequest<ENTITYNAME> = ENTITYNAME.fetchRequest()
        let Sleeprequest : NSFetchRequest<Sleep> = Sleep.fetchRequest()
        
        let lastElement = childuser.last
        if lastElement != nil{
            request.predicate = NSPredicate(format: "(username MATCHES [cd] %@) && (firstName MATCHES [cd] %@)", receivedString, String(lastElement!))
            Sleeprequest.predicate = NSPredicate(format: "username MATCHES [cd] %@", receivedString)
            let SleepReq = (try? context.fetch(Sleeprequest))!
            let childrequest = (try? context.fetch(request))!
            
            for names in childrequest {
                ChildProfilefirst.append(names.firstName!)
                ChildProfilelast.append(names.lastName!)
                ChildProfileDate.append(names.birthday!)
                let image = UIImage(data: names.image!)
                // set the image to your UIImageView
                ChildProfileImage.append(image!)
                
                
                print("Child Match Selected User:,", names.firstName!, childuser)
                
            }
          
            do{
                sleeparray = try context.fetch(Sleeprequest)
                ChildArray = try context.fetch(request)
            } catch{
                print("Error fetching data \(error)")
            }
        }
        else{
            request.predicate = NSPredicate(format: "(username MATCHES [cd] %@)", receivedString)
            let childrequest2 = (try? context.fetch(request))!
            for names in childrequest2 {
                ChildProfilefirst.append(names.firstName!)
                ChildProfilelast.append(names.lastName!)
                ChildProfileDate.append(names.birthday!)
                let image = UIImage(data: names.image!)
                // set the image to your UIImageView
                ChildProfileImage.append(image!)
                
                
                print("Child Match Defualt User:", names.firstName!)
                
            }
            do{
                ChildArray = try context.fetch(request)
            } catch{
                print("Error fetching data \(error)")
            }
        }
//        -------------------------------------------------------------------------------------------
        
        if (login_child != nil && !login_child.isEmpty) {
            //set defualt child for system
            defualt_child = login_child
            print("Default Child is Login in ", defualt_child)
        }
        else{
            // defualt child they first signed up
            defualt_child = signup_child
            print("Default Child is Sign up", defualt_child)
            
        }
        if childuser.last != nil{
            defualt_child = ""
        }
        print("Defualt CHild", defualt_child)
        let journalrequest : NSFetchRequest<Journal> = Journal.fetchRequest()
        if (childuser.last != nil && !childuser.last!.isEmpty) {
           
            print("This is Childuser Journal: ", childuser.last!)
            do{
                JournalArray = try context.fetch(journalrequest)
                journalrequest.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, childuser.last!)
                let journalhistory = (try? context.fetch(journalrequest))!
                for j in journalhistory {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm" // set the date format
                    let date = j.currentdate! // replace this with your own date object
                    let entry = Entry(date: date, message: j.notes!)
                    entries.append(entry)
                    
                    print("Journal values:", j.currentdate!,"AND",j.notes!)
                }
            }
            catch{
                print("Error fetching data \(error)")
            }
        }
        else if (childuser.last == nil){
           
            do{
                JournalArray = try context.fetch(journalrequest)
                journalrequest.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, defualt_child)
                let journalhistory = (try? context.fetch(journalrequest))!
                for j in journalhistory {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm" // set the date format
                    let date = j.currentdate! // replace this with your own date object
                    let entry = Entry(date: date, message: j.notes!)
                    entries.append(entry)

                    print("Journal values:", j.currentdate!,"AND",j.notes!)
                }
            }
            catch{
                print("Error fetching data \(error)")
            }
        }

        
//        -------------------------------------------------------------------------------------------
        let behaviorrequest : NSFetchRequest<Behavior> = Behavior.fetchRequest()
        let behaviorrequest2 : NSFetchRequest<Behavior> = Behavior.fetchRequest()
        if (childuser.last != nil && !childuser.isEmpty) {
            
            print("This is Childuser Behaviour: ", childuser.last!)
            do{
                BehaviorArray = try context.fetch(behaviorrequest)
                behaviorrequest.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, childuser.last! )
                let behaviourhistory = (try? context.fetch(behaviorrequest))!
                for b in behaviourhistory {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yy HH:mm" // set the date format
                    let date = b.currentdate! // replace this with your own date object
                    let entry = Entry(date: date, message: b.notes!)
                    entries.append(entry)
                    
                    print("Behaviour values:", b.currentdate!,"AND",b.notes!)
                }
            } catch{
                print("Error fetching data \(error)")
            }
        }
        else if (childuser.last == nil && childuser.isEmpty) {
            do{
                BehaviorArray = try context.fetch(behaviorrequest2)
                behaviorrequest2.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, defualt_child)
                let behaviourhistory = (try? context.fetch(behaviorrequest2))!
                for b in behaviourhistory {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yy HH:mm" // set the date format
                    let date = b.currentdate! // replace this with your own date object
                    let entry = Entry(date: date, message: b.notes!)
                    entries.append(entry)

                    print("Behaviour values:", b.currentdate!,"AND",b.notes!)
                }
            } catch{
                print("Error fetching data \(error)")
            }
        }
    }
    
    func SaveItems(){
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
    }
}


