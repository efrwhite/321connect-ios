//
//  HomeScreenViewControllerExt.swift
//  321connect-ios
//
//  Created by Edward Ladia on 11/8/21.
//

import Foundation
import UIKit
import CoreData

class HomeScreenViewControllerExt: UIViewController {
    
    // homescreen(ext) vc local variables
    @IBOutlet weak var feedButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var sleepButton: UIButton!
    @IBOutlet weak var behaviorButton: UIButton!
    @IBOutlet weak var resourcesButton: UIButton!
    @IBOutlet weak var medicalButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var developmentButton: UIButton!
    @IBOutlet weak var Agelabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var bathroomButton: UIButton!
    @IBOutlet weak var journalButton: UIButton!
    @IBOutlet weak var medicationButton: UIButton!
    @IBOutlet weak var signInOutButton: UIButton!
    var receivedString = ""
    var user = ""
    var childArray = [Child]()
    var userchild = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var ChildProfile = [String]()
    var ChildProfileDate = [Date]()
    var ChildProfileImage = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        print("Extended HomeScreen Passed", receivedString)
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadInputViews()
        loadItems()
        //        reloadInputViews()
        let lastElement = userchild
        if lastElement != nil && lastElement != ""{
            let date = Date()
            
            // Create Date Formatter
            let dateFormatter = DateFormatter()
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            
            // Set Date Format
            dateFormatter.dateFormat = "YYYY/MM/dd"
            
            // Convert Date to String
            dateFormatter.dateFormat = "YYYY/MM/dd"
            print("CHILD passed:", lastElement)
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
            self.namelabel.text = strfnln
            self.Agelabel.text = "Age: " + age
        }
    }
    
    
    // all 12 buttons linked to ibaction
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        /* switch to case to corresponding (storyboard)
         manual segues used */
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ResourceSegueView2"){
            let displayVC = segue.destination as! ResourcesTableViewController
            displayVC.userchild = userchild
            displayVC.user = receivedString
        }
        if(segue.identifier == "FoodSegueHomeScreen2"){
            let displayVC = segue.destination as! FeedViewController
            displayVC.userchild = userchild
            displayVC.user = receivedString
        }
        
        if (segue.identifier == "BehaviourSegue2"){
            let displayVC = segue.destination as! BehaviorViewController
            displayVC.userchild = userchild
            displayVC.user = receivedString
        }
        if (segue.identifier == "HomeScreenViewExt")
        {
            let destViewController = segue.destination as! UINavigationController
            let secondViewcontroller = destViewController.viewControllers.first as! HomeScreenViewController
           
            secondViewcontroller.user = receivedString
        }
        if (segue.identifier == "SleepViewSegue2"){
            let displayVC = segue.destination as! SleepViewController
            displayVC.userchild = userchild
            displayVC.user = receivedString
        }
        if (segue.identifier == "ActivityViewSegue2"){
            let displayVC = segue.destination as! ActivityViewController
            displayVC.userchild = userchild
            displayVC.user = receivedString
        }
        if (segue.identifier == "JournalViewSegue"){
            let displayVC = segue.destination as! JournalViewController
            displayVC.userchild = userchild
            displayVC.user = receivedString
        }
        
        if (segue.identifier == "BathroomViewSegue"){
            let displayVC = segue.destination as! BathroomViewController
            displayVC.userchild = userchild
            displayVC.user = receivedString
        }
        if (segue.identifier == "DevelopmentViewSegue"){
            let displayVC = segue.destination as! DevelopmentViewController
            displayVC.userchild = userchild
            displayVC.user = receivedString
        }
        if (segue.identifier == "HomeExtDV"){
            let displayVC = segue.destination as! MedicalViewController
            displayVC.userchild = userchild
            displayVC.user = receivedString
        }
    }
    func SaveItems(){
        
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
    }
    
    func loadItems(){
        let request : NSFetchRequest<Child> = Child.fetchRequest()
        let lastElement = userchild
        if lastElement != nil{
            request.predicate = NSPredicate(format: "(username MATCHES [cd] %@) && (firstName MATCHES [cd] %@)", receivedString, String(lastElement))
            
            
            let childrequest = (try? context.fetch(request))!
            
            
            for names in childrequest {
                ChildProfile.append(names.firstName!)
                ChildProfile.append(names.lastName!)
                ChildProfileDate.append(names.birthday!)
                print("Child Match name,", names.firstName!, userchild)
                
            }
            do{
                childArray = try context.fetch(request)
            } catch{
                print("Error fetching data \(error)")
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
    @IBAction func signOutButtonTapped(_ sender: Any) {
        // Remove user's credentials or access token from app storage
        // ...
        
        // Navigate to the login screen
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen 
        self.present(loginVC, animated: true, completion: nil)
    }
}
