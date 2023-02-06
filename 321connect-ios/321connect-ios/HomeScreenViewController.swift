//
//  HomeScreenViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/11/22.
//


import Foundation
import UIKit
import CoreData
class HomeScreenViewController: UIViewController,getItemsDelegate{
   
    
    func getItems(_ items: [String]) {
        childuser = items
        print("ITEMS: ",childuser)
       
    }
    var ChildProfile = [String]()
    var ChildProfileDate = [Date]()
    var ChildProfileImage = [UIImage]()
    var ChildArray = [Child]()
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
    
    // extension button to return to home screen
    @IBAction func extentionButton(_ sender: Any) {
    }
    
    // automatic segue - unwind
    @IBAction func unwindToHomeScreenExtVC(segue: UIStoryboardSegue) {
        
    }
    
    // automatic segue
    /* possible change to 'segmented control' */
  
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadInputViews()
        loadItems()
//        reloadInputViews()
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
            var firstname = String(ChildProfile.first!)
            var lastname = String(ChildProfile.last!)
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
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
     
        // profile image mask and style
        childImage.layer.borderWidth = 1.0
        childImage.layer.masksToBounds = false
        childImage.layer.borderColor = UIColor.white.cgColor
        childImage.layer.cornerRadius = childImage.frame.size.width/2
        childImage.clipsToBounds = true
        receivedString = user
        print("HOME SCREEN Passed", receivedString)
        
      
        
        //        let appearance = UINavigationBarAppearance()
        //        appearance.backgroundColor = .clear
        //        appearance.shadowColor = .clear
        //        navigationController?.navigationBar.standardAppearance = appearance
        //
        //        navigationController?.navigationBar.compactAppearance = appearance
        //        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        RecentEntryTableView.layer.cornerRadius = 10
        RecentEntryTableView.clipsToBounds = true
        RecentEntryTableView.layer.borderWidth = 1
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "HomeScreenViewExt")
        {
            let destViewController = segue.destination as! UINavigationController
            let secondViewcontroller = destViewController.viewControllers.first as! HomeScreenViewControllerExt
            secondViewcontroller.user = receivedString
        }
        if(segue.identifier == "ResourcesView"){
                let displayVC = segue.destination as! ResourcesTableViewController
                displayVC.user = receivedString
            }
        if(segue.identifier == "FoodSegueHomeScreen1"){
                let displayVC = segue.destination as! FeedViewController
                displayVC.user = receivedString
            }
      
        if (segue.identifier == "BehaviorSegue1"){
            let displayVC = segue.destination as! BehaviorViewController
            displayVC.user = receivedString
        }
        if (segue.identifier == "SleepViewSegue"){
            let displayVC = segue.destination as! SleepViewController
            displayVC.user = receivedString
        }
        if (segue.identifier == "ActivityViewSegue"){
            let displayVC = segue.destination as! ActivityViewController
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
            displayVC.user = receivedString
        }
        
    }
    func loadItems(){
        
        let request : NSFetchRequest<Child> = Child.fetchRequest()
        let lastElement = childuser.last
        if lastElement != nil{
            request.predicate = NSPredicate(format: "(username MATCHES [cd] %@) && (firstName MATCHES [cd] %@)", receivedString, String(lastElement!))
            
            
            let childrequest = (try? context.fetch(request))!
            
            
            for names in childrequest {
                ChildProfile.append(names.firstName!)
                ChildProfile.append(names.lastName!)
                ChildProfileDate.append(names.birthday!)
                print("Child Match name,", names.firstName!, childuser)
                
            }
            
            
            do{
                ChildArray = try context.fetch(request)
                
                
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


