//
//  HomeScreenViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/11/22.
//

import Foundation
import UIKit
import CoreData

class HomeScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    let request : NSFetchRequest<Child> = Child.fetchRequest()
    let accountrequest : NSFetchRequest<Account> = Account.fetchRequest()
    let journalrequest : NSFetchRequest<Journal> = Journal.fetchRequest()
    let behaviorrequest : NSFetchRequest<Behavior> = Behavior.fetchRequest()
    let sleeprequest : NSFetchRequest<Sleep> = Sleep.fetchRequest()
    let activityrequest : NSFetchRequest<Activity> = Activity.fetchRequest()
//        let bathroomrequest : NSFetchRequest<Bathroom> = Bathroom.fetchRequest()
//        let feedrequest : NSFetchRequest<Feed> = Feed.fetchRequest()
    
    // Recent Entry struct
    struct Entry {
        var date: Date
        var message: String
    }
    
//    func getItems(_ items: [String]) {
//        childuser = items
//        print("ITEMS: ",childuser)
//    }
    
    var ChildProfilefirst = [String]()
    var ChildProfilelast = [String]()
    var ChildProfileDate = [Date]()
    var ChildProfileImage = [UIImage]()
    var ChildArray = [Child]()
    var Sleepy = [String]()
    var SleepyDate = [Date]()
    var SleepArray = [Sleep]()
    var BehaviorArray = [Behavior]()
    var JournalArray = [Journal]()
    var ActivityArray = [Activity]()
    var BathroomArray = [Bathroom]()
    var AccountArray = [Account]()
    var entries = [Entry]()
//    var journalentries = [Entry]()
    var login_child = ""
    var signup_child = ""
    var defualt_child = ""
    var firstname = ""
    var lastname = ""
    var birthdaydate = ""
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
    @IBOutlet weak var childImage: UIImageView!
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
        
//        print("Array of SleepDates",SleepyDate)
//        print("Array of Sleep:", Sleepy)
        
            let date = Date()
            
            let dateFormatter = DateFormatter()
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            
            // Set Date Format
            dateFormatter.dateFormat = "YYYY/MM/dd"
            
            // Convert Date to String
            dateFormatter.dateFormat = "YYYY/MM/dd"
            
            // setting the labels and calculating age
            let strfnln = firstname + " " + lastname
            print("This is the defualt Child name: ",strfnln)
            print("This is their birthday: ", birthdaydate)
            let components = birthdaydate.components(separatedBy: "/")
            var childyear = components.first!
            var intchidyear = Int(childyear)
        print("Int Child Year", intchidyear ?? 0)
            var currentyear = Int(year)
            print("CURRENT YEAR",currentyear)
        var diffyear = currentyear - (intchidyear ?? 0)
            var age = String(diffyear)
            self.labelISO.text = strfnln
            self.Agelabel.text = "Age: " + age
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
       
        if (segue.identifier == "HomeScreenViewExt"){
            let destViewController = segue.destination as! UINavigationController
            let secondViewcontroller = destViewController.viewControllers.first as! HomeScreenViewControllerExt
            secondViewcontroller.userchild = defualt_child
            secondViewcontroller.user = receivedString
        }
        if(segue.identifier == "ResourcesView"){
            let displayVC = segue.destination as! ResourcesTableViewController
            displayVC.userchild = defualt_child
            displayVC.user = receivedString
        }
        if(segue.identifier == "FoodSegueHomeScreen1"){
            let displayVC = segue.destination as! FeedViewController
            displayVC.userchild = defualt_child
            displayVC.user = receivedString
        }
        if (segue.identifier == "BehaviorSegue1"){
            let displayVC = segue.destination as! BehaviorViewController
            displayVC.userchild = defualt_child
            displayVC.user = receivedString
        }
        if (segue.identifier == "SleepViewSegue"){
            let displayVC = segue.destination as! SleepViewController
            displayVC.userchild = defualt_child
            displayVC.user = receivedString
        }
        if (segue.identifier == "ActivityViewSegue"){
            let displayVC = segue.destination as! ActivityViewController
            displayVC.userchild = defualt_child
            displayVC.user = receivedString
        }
        if (segue.identifier == "ProfilesViewSegue"){
            let displayVC = segue.destination as! ProfilesViewController
            displayVC.user = receivedString
        }
        if (segue.identifier == "HomeDV"){
            let displayVC = segue.destination as! MedicalViewController
            displayVC.userchild = defualt_child
            displayVC.user = receivedString
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
        
        do{
            AccountArray = try context.fetch(accountrequest)
            accountrequest.predicate = NSPredicate(format: "(userName MATCHES [cd] %@) ", receivedString)
            let accounthistory = (try? context.fetch(accountrequest))!
            for defualtchild in accounthistory {
                if defualtchild.defualtChild != nil {
                    defualt_child = defualtchild.defualtChild!
                }
            }

            ChildArray = try context.fetch(request)
            request.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND firstName MATCHES [cd] %@) ", receivedString, defualt_child)
            let childreq = (try? context.fetch(request))!
            for child in childreq{
                firstname = (child.firstName!)
                lastname = (child.lastName!)
                // Create Date Formatter
                let dateFormatter = DateFormatter()
                // Set Date Format
                dateFormatter.dateFormat = "YYYY/MM/dd"
                // Convert Date to String
                dateFormatter.dateFormat = "YYYY/MM/dd"
                birthdaydate = dateFormatter.string(from: child.birthday!)
                //do image later
                if let imageData = child.image, let image = UIImage(data: imageData){
                    childImage.image = image
                }else {
                    let personImage = UIImage(systemName: "person.fill")?.withTintColor(UIColor.lightGray)
                    childImage.image = personImage
                }
            }
            childImage.contentMode = .scaleAspectFill
        }
        catch{
            print("Error fetching data \(error)")
        }
        
        // Store objects into corresponding arrays
        do{
            JournalArray = try context.fetch(journalrequest)
            journalrequest.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, defualt_child)
            let journalhistory = (try? context.fetch(journalrequest))!
            for j in journalhistory {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yyyy HH:mm" // set the date format
                let date = j.currentdate! // replace this with your own date object
                let message = ("Saved a journal entry for " + j.childName!)
                let entry = Entry(date: date, message: message)
                entries.append(entry)
                
                print("Journal values:", j.currentdate!)
            }
            
            BehaviorArray = try context.fetch(behaviorrequest)
            behaviorrequest.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, defualt_child )
            let behaviourhistory = (try? context.fetch(behaviorrequest))!
            for b in behaviourhistory {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yy HH:mm" // set the date format
                let date = b.currentdate! // replace this with your own date object
                let hours = Int(b.time / 3600)
                let minutes = Int((b.time / 60).truncatingRemainder(dividingBy: 60))
                
                /* create message string for entry output*/
                var message: String
                if hours > 0 {
                    message = "\(b.childName!) was \(b.moodType!.lowercased()) for \(hours) hours and \(minutes) minutes"
                } else {
                    message = "\(b.childName!) was \(b.moodType!.lowercased()) for \(minutes) minutes"
                }
                let entry = Entry(date: date, message: message)
                entries.append(entry)

                print("Behaviour values:", b.currentdate!,"AND",b.notes!)
            }
            
            SleepArray = try context.fetch(sleeprequest)
            sleeprequest.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, defualt_child )
            let sleephistory = (try? context.fetch(sleeprequest))!
            for s in sleephistory {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yy HH:mm" // set the date format
                let date = s.currentdate!
                let hours = Int(s.duration / 3600)
                let minutes = Int((s.duration / 60).truncatingRemainder(dividingBy: 60))
                
                /* create message string for entry output*/
                var message: String
                if hours > 0 {
                    message = "\(s.childName!) slept for \(hours) hours and \(minutes) minutes"
                } else {
                    message = "\(s.childName!) slept for \(minutes) minutes"
                }
                let entry = Entry(date: date, message: message)
                entries.append(entry)
            }
            
            ActivityArray = try context.fetch(activityrequest)
            activityrequest.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND childName MATCHES [cd] %@) ", receivedString, defualt_child )
            let activityhistory = (try? context.fetch(activityrequest))!
            for a in activityhistory {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yy HH:mm" // set the date format
                let date = a.currentdate!
                let hours = Int(a.duration / 3600)
                let minutes = Int((a.duration / 60).truncatingRemainder(dividingBy: 60))
                
                /* create message string for entry output*/
                var message: String
                if hours > 0 {
                    message = "\(a.childName!) was \(a.activityType!.lowercased()) for \(hours) hours and \(minutes) minutes"
                } else {
                    message = "\(a.childName!) was \(a.activityType!.lowercased()) for \(minutes) minutes"
                }
                let entry = Entry(date: date, message: message)
                entries.append(entry)
            }

        }catch{
            print("Error fetching data \(error)")
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



