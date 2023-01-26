//
//  HomeScreenViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/11/22.
//


import Foundation
import UIKit


class HomeScreenViewController: UIViewController{
    
    // homescreen(ext) vc local variables
    @IBOutlet weak var feedButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var sleepButton: UIButton!
    @IBOutlet weak var behaviorButton: UIButton!
    @IBOutlet weak var resourcesButton: UIButton!
    @IBOutlet weak var medicalButton: UIButton!
    @IBOutlet weak var profilesButton: UIButton!
    
    @IBOutlet weak var RecentEntryTableView: UITableView!
    @IBOutlet weak var childImage: UIButton!
    @IBOutlet weak var labelISO: UILabel!
    var receivedString = ""
    var user = ""
    // extension button to return to home screen
    @IBAction func extentionButton(_ sender: Any) {
    }
    
    // automatic segue - unwind
    @IBAction func unwindToHomeScreenExtVC(segue: UIStoryboardSegue) {
        
    }
    
    // automatic segue
    /* possible change to 'segmented control' */
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
}
