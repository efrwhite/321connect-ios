//
//  HomeScreenViewControllerExt.swift
//  321connect-ios
//
//  Created by Edward Ladia on 11/8/21.
//

import Foundation
import UIKit

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
    @IBOutlet weak var bathroomButton: UIButton!
    @IBOutlet weak var journalButton: UIButton!
    @IBOutlet weak var medicationButton: UIButton!
    @IBOutlet weak var signInOutButton: UIButton!
    var receivedString = ""
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        print("Extended HomeScreen Passed", receivedString)
        // Do any additional setup after loading the view.
        
    }
    
    // all 12 buttons linked to ibaction
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        /* switch to case to corresponding (storyboard)
            manual segues used */
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ResourceSegueView2"){
                let displayVC = segue.destination as! ResourcesTableViewController
                displayVC.user = receivedString
            }
        if(segue.identifier == "FoodSegueHomeScreen2"){
                let displayVC = segue.destination as! FeedViewController
                displayVC.user = receivedString
            }
     
        if (segue.identifier == "BehaviourSegue2"){
            let displayVC = segue.destination as! BehaviorViewController
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
            displayVC.user = receivedString
        }
        if (segue.identifier == "ActivityViewSegue2"){
            let displayVC = segue.destination as! ActivityViewController
            displayVC.user = receivedString
        }
        if (segue.identifier == "JournalViewSegue"){
            let displayVC = segue.destination as! JournalViewController
            displayVC.user = receivedString
        }
      
        if (segue.identifier == "BathroomViewSegue"){
            let displayVC = segue.destination as! BathroomViewController
            displayVC.user = receivedString
        }
        if (segue.identifier == "DevelopmentViewSegue"){
            let displayVC = segue.destination as! DevelopmentViewController
            displayVC.user = receivedString
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
